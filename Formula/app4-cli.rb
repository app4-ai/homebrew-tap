# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.106.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-106-0-darwin-arm64.gz"
      sha256 "fce8aba47ae3088f485779e0151c41b209837a6b545bd0dd90d0658842f9d73e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-106-0-darwin-amd64.gz"
      sha256 "da4b0d901759d556c957a55f39f2a0c6809046ce466ff03ce0bd43aa162b0230"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-106-0-linux-arm64.gz"
      sha256 "d5b0193820e8c4034351cb94ec957590787e968cc87f8edb39136366466d394e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-106-0-linux-amd64.gz"
      sha256 "a88333b309b8dc6bc885ca4c292003d036e25f73ce4a68d96c0cd9dff381d5d8"
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
