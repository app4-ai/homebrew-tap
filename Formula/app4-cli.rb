# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.148.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-148-1-darwin-arm64.gz"
      sha256 "ef3fa6bd815f55adfcc4365c27110ecd644ecc80e4bafffd8a66d489e5422b75"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-148-1-darwin-amd64.gz"
      sha256 "44313bc8b2603739e212d94e6a55f602c7326fdd910af962f609d43f8180a700"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-148-1-linux-arm64.gz"
      sha256 "f885493db643e0704e9beb55612abe11a558b9888e998bcd5ea7ce23bee6f6b1"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-148-1-linux-amd64.gz"
      sha256 "fb1302952caa66e9700a8ea43b0dd6fdedca6903713dc3c5829550184b5d5f2d"
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
