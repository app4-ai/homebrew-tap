# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.101.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-101-0-darwin-arm64.gz"
      sha256 "c4983cc67c9079359024c15b4da8f0deb1497b85bd2ca0063e442748f807ddbb"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-101-0-darwin-amd64.gz"
      sha256 "a4b88e2f9627b8720aa01d4480b8f09e98d96693291ff57c588ebe40c5aface6"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-101-0-linux-arm64.gz"
      sha256 "54f69c3ef4f402dca2c6d165d6452288f85e33008e88c5daa84fac85167de7f9"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-101-0-linux-amd64.gz"
      sha256 "11d38563c7fe4588db8a1534d5a2c0941b112a08bd9059ca4a02991ffdae767c"
    end
  end

  def install
    # Homebrew gunzips the download; the remaining file is the bare binary.
    bin.install Dir["app4*"].reject { |f| f.end_with?(".gz") }.first => "app4"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/app4 --version")
  end
end
