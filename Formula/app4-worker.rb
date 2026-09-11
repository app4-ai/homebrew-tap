class App4Worker < Formula
  desc "App4 Studio worker: runs agent sessions on this machine"
  homepage "https://app4.dev"
  version "0.1.178"
  license "Apache-2.0"
  depends_on "app4-cli"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/studio-v-0.1.178/app4-worker-darwin-arm64.tar.gz"
      sha256 "dd8253fb6bbdbe4d4a11835b9d365109ad77c0ae3e6d590d731d7b0d5ab1c420"
    end
  end
  on_linux do
    on_intel do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/studio-v-0.1.178/app4-worker-linux-amd64.tar.gz"
      sha256 "0c686967f1e0ad8fcfedb5e9a4942267f9c9fe13411e234b6dadf3f9f4fd7cf4"
    end
  end

  def install
    supported = (OS.mac? && Hardware::CPU.arm?) || (OS.linux? && Hardware::CPU.intel?)
    odie "app4-worker ships for Apple Silicon and Linux x86_64 only" unless supported
    bin.install "app4-worker", "studio-mcp-bridge", "app4-test-runner", "app4-test-runner-pwinstall"
    (pkgshare/"skills").install Dir["skills/*"]
  end

  test do
    assert_equal "studio-v-#{version}", shell_output("#{bin}/app4-worker --version").strip
  end
end
