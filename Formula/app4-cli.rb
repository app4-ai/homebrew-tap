# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.131.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-3-darwin-arm64.gz"
      sha256 "b28cc26f7611182ee0881671c934084ee01ae6695e779d78789e19e258860d74"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-3-darwin-amd64.gz"
      sha256 "2e2dd6528f324f4ca17a796dca645596744e261c05193875fa2f5c96e97200ee"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-3-linux-arm64.gz"
      sha256 "f8b1cef9d2fe646163e34780919f2c7f46370f7ed1d0c598d430858fe133c23b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-3-linux-amd64.gz"
      sha256 "53d2f1ab10206592f83d2466a2c6842d07e8c20bfa11b639ab6f7cab654f3169"
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
