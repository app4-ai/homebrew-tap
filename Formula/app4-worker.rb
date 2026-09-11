class App4Worker < Formula
  desc "App4 Studio worker: runs agent sessions on this machine"
  homepage "https://app4.dev"
  version "0.1.176"
  license "Apache-2.0"
  depends_on "app4-cli"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/studio-v-0.1.176/app4-worker-darwin-arm64.tar.gz"
      sha256 "7277430f9e710c754bdb08733eea378f5db19aeac2facee93a4ce3bea08ff75d"
    end
  end
  on_linux do
    on_intel do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/studio-v-0.1.176/app4-worker-linux-amd64.tar.gz"
      sha256 "2df2ad9f9a51e47d2c78656dd79ca8d250fcd8b9590b3ba6564015c60aa6cb62"
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
