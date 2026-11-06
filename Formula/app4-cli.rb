# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.132.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-4-darwin-arm64.gz"
      sha256 "8c902c46faf3821579e91b21ce8cc09adb4e06e454bed7e3d6a00b4219707530"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-4-darwin-amd64.gz"
      sha256 "2731588488b0c3719e0c4c141318cdb240af01c22d07df15b69ff6f36f1e239a"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-4-linux-arm64.gz"
      sha256 "28aeac256543ca5d4dc6a91f419c46efd5e2c1a465c6438300117eaf5a6bbf28"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-4-linux-amd64.gz"
      sha256 "2d60042e1f19527b9b346ab03a3672c27e96e4c5243efdebabbaca3d182a49ef"
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
