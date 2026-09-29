# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.48.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-48-2-darwin-arm64.gz"
      sha256 "2f6c38debcb2709cd1624fff63120a6dc140ac47d3d3435c1c815b368ea0e0ce"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-48-2-darwin-amd64.gz"
      sha256 "4132e52a8cb4fc1c580034031b81c14d8b927d88d9a8217a5f2c87d2a376c23d"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-48-2-linux-arm64.gz"
      sha256 "ce845d406315eb6dd713b5f2bc310073e63dc128d189c6dd7df2055622e014b0"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-48-2-linux-amd64.gz"
      sha256 "048f40bafd144d2c571294a7b8c43c5ea40acca1e8d3b48d3a36cdd8eeb6ee7f"
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
