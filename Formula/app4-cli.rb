# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.97.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-97-0-darwin-arm64.gz"
      sha256 "5944caaed16fcf91347496dcb462000d47444887c10753a2d411e8a82b7c77e5"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-97-0-darwin-amd64.gz"
      sha256 "2963b63d4a158024f3f4d4a91832b76ddacc9f4b26d0283872914ae4c9e8724b"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-97-0-linux-arm64.gz"
      sha256 "680ad27b98ff4827ab5d525a263175aa288c25e6e8b21f50b93bcdd9702f25a8"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-97-0-linux-amd64.gz"
      sha256 "146ad0e7d0d3fa25b86a7099a863e17cd0e4806df232c3e1325d0256854e0145"
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
