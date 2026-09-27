# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.42.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-42-0-darwin-arm64.gz"
      sha256 "7cc4194753b58307bbde426beaca243d51f5e7b33da54518796e6a5354d75547"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-42-0-darwin-amd64.gz"
      sha256 "ea2d86f95d712b4ff73361e8d9261a4582f084bd122bc16b8c1e49bd0a9b7638"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-42-0-linux-arm64.gz"
      sha256 "923ad4b2f9b1e8c155e9644a0857eea41aaba44919aa2e6e5427f3fe937146cb"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-42-0-linux-amd64.gz"
      sha256 "aef870b9f96736e9bcdc253a2be9a92d3c26067a56c53a6c766d02f1f1aa17e9"
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
