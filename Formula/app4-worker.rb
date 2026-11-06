class App4Worker < Formula
  desc "App4 Studio worker: runs agent sessions on this machine"
  homepage "https://app4.dev"
  version "0.2.41"
  license "Apache-2.0"
  depends_on "app4-cli"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-worker/worker-v-0.2.41/app4-worker-darwin-arm64.tar.gz"
      sha256 "5524524c62f566c66676a233b839c3c0ced0e654bdff0a1608dba8abc97ab77d"
    end
  end
  on_linux do
    on_intel do
      url "https://s3.app4.studio/app4-worker/worker-v-0.2.41/app4-worker-linux-amd64.tar.gz"
      sha256 "4a9bf46104fddab266d0bc6ffa82286b10c8caed8fefa6546ece4b2970573318"
    end
  end

  def install
    supported = (OS.mac? && Hardware::CPU.arm?) || (OS.linux? && Hardware::CPU.intel?)
    odie "app4-worker ships for Apple Silicon and Linux x86_64 only" unless supported
    bin.install "app4-worker", "agent-exec", "studio-mcp-bridge", "app4-test-runner", "app4-test-runner-pwinstall"
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
