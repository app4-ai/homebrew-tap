# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.89.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-89-1-darwin-arm64.gz"
      sha256 "7875fd773152ddff7dbd28cb01aa0832dacdc64ad71fa0042460061c6e25f483"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-89-1-darwin-amd64.gz"
      sha256 "46a6b81b26df6359f2524d3f3e3717b62f438ea335dc9fcd6527305d8b2ef148"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-89-1-linux-arm64.gz"
      sha256 "b99ff8b6f1752260891ccf2a9a70d3cc9c2c67d4959147abde66e3db06eef4a8"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-89-1-linux-amd64.gz"
      sha256 "ec000c3f581dfa1f0200fb73aa13a91dd20f0bca3fd7a5127171c780ee78745e"
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
