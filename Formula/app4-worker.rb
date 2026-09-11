class App4Worker < Formula
  desc "App4 Studio worker: runs agent sessions on this machine"
  homepage "https://app4.dev"
  version "0.1.174"
  license "Apache-2.0"
  depends_on "app4-cli"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/studio-v-0.1.174/app4-worker-darwin-arm64.tar.gz"
      sha256 "ed59998a0c3484765a0dc338ca9b1616379cd2666aa937051a051eaf3c3d220f"
    end
  end
  on_linux do
    on_intel do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/studio-v-0.1.174/app4-worker-linux-amd64.tar.gz"
      sha256 "7cb1d2cbde232cc5ca097f87e7c0c3625f5686f40d1ba3a30072b224475e02b7"
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
