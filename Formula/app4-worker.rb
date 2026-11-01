class App4Worker < Formula
  desc "App4 Studio worker: runs agent sessions on this machine"
  homepage "https://app4.dev"
  version "0.2.30"
  license "Apache-2.0"
  depends_on "app4-cli"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-worker/worker-v-0.2.30/app4-worker-darwin-arm64.tar.gz"
      sha256 "93a80fc6ca8698efbfa320e135796afbfa2e2ffdc0a381eca8c750397bed2861"
    end
  end
  on_linux do
    on_intel do
      url "https://s3.app4.studio/app4-worker/worker-v-0.2.30/app4-worker-linux-amd64.tar.gz"
      sha256 "ecf0262402598d38a80d4421f14778cbc915c685a692b5d3552ae59ba3e5c1d5"
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
