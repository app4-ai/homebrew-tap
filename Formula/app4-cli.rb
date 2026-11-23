# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.144.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-1-darwin-arm64.gz"
      sha256 "6ac210a06532d9e0beb6318d537e20d7137cb123fdfdf589884164878d86c2cc"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-1-darwin-amd64.gz"
      sha256 "5a1f6a866365a8a07a72efc7f4212ca0be3328930e8ab8e5396dea4212320a1b"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-1-linux-arm64.gz"
      sha256 "6ccfc70821552bb65fe4f6c80a731925642da40cecd10c2db9c4e9cd3d8d1d7f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-1-linux-amd64.gz"
      sha256 "b66ff92fd95ed9f599233bb8c57094f03e66611f67039495b3193816d5e3deab"
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
