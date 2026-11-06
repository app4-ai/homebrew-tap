# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.132.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-3-darwin-arm64.gz"
      sha256 "564cd8964af0645b641570585fc5cdb1791a1e7aeebb6a25b58f46ba6da52692"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-3-darwin-amd64.gz"
      sha256 "2d208dbd59fff9cc28e49144e2f25973c30198b2190aac6c16a07647bb3b66fb"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-3-linux-arm64.gz"
      sha256 "abfe6120e99dd4b3cbe3f71542e3ed932e1f6969f2a44381444ffb00bde4d713"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-3-linux-amd64.gz"
      sha256 "ffdb352957baf02c939ee0662ada2f8cf9d8ab43fceeaab9ebe37ca1ce59a792"
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
