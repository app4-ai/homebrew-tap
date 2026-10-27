# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.117.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-117-0-darwin-arm64.gz"
      sha256 "69d271c425bf35e9dce3f80cf871b290489cd6aff5f37da87b0c772315cbde5d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-117-0-darwin-amd64.gz"
      sha256 "46a81aaeda6b0a55b3878a86b35af032c3c2d2e19436513a72f55b7f90aac641"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-117-0-linux-arm64.gz"
      sha256 "338313ec1fcaa1579db976947f9a6a13edb5413875c64c9b7d5a42734a74f7a4"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-117-0-linux-amd64.gz"
      sha256 "e535270fcd8baa0e9f345df906ea56cc6ad1962bb2a950d4648c762246a0ab07"
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
