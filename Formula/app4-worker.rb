class App4Worker < Formula
  desc "App4 Studio worker: runs agent sessions on this machine"
  homepage "https://app4.dev"
  version "0.1.234"
  license "Apache-2.0"
  depends_on "app4-cli"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/worker-v-0.1.234/app4-worker-darwin-arm64.tar.gz"
      sha256 "cc30632e7c67a507bf49bfaf281d11121201db47da43dce33defe8a618414222"
    end
  end
  on_linux do
    on_intel do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/worker-v-0.1.234/app4-worker-linux-amd64.tar.gz"
      sha256 "410de55c19f0d3c69526f891a0df1d1a1336a23d584e790244ffc03ee5256473"
    end
  end

  def install
    supported = (OS.mac? && Hardware::CPU.arm?) || (OS.linux? && Hardware::CPU.intel?)
    odie "app4-worker ships for Apple Silicon and Linux x86_64 only" unless supported
    bin.install "app4-worker", "studio-mcp-bridge", "app4-test-runner", "app4-test-runner-pwinstall"
    (pkgshare/"skills").install Dir["skills/*"]
  end

  def caveats
    <<~EOS
      Register this machine as a worker with a token from app4.studio › Workers › Add worker:
        app4-worker register --token <token>
      Update it on this machine with `app4-worker update`.
    EOS
  end

  test do
    assert_equal "worker-v-#{version}", shell_output("#{bin}/app4-worker --version").strip
  end
end
