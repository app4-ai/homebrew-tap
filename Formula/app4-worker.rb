class App4Worker < Formula
  desc "App4 Studio worker: runs agent sessions on this machine"
  homepage "https://app4.dev"
  version "0.1.199"
  license "Apache-2.0"
  depends_on "app4-cli"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/worker-v-0.1.199/app4-worker-darwin-arm64.tar.gz"
      sha256 "fb50e1df278d0c327186bea00a18b67064b1f8a75547361956aef56ac761b088"
    end
  end
  on_linux do
    on_intel do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/worker-v-0.1.199/app4-worker-linux-amd64.tar.gz"
      sha256 "c4ea15bc7d1272ebe55d8f14273a11cba645cad25d08e7f330bb51c1b05aba4f"
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
