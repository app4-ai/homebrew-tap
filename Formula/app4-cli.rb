# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.149.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-149-0-darwin-arm64.gz"
      sha256 "51836070b18a9804fdd0a26aeb389ba91234338f66c42f9eb938c12d70fde216"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-149-0-darwin-amd64.gz"
      sha256 "057a6732aeaf3713bfaacb36292b5c8cce9a35cb7b4c474868098a4a78d5398e"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-149-0-linux-arm64.gz"
      sha256 "cca968041c7b0c4de209ef3ecb009cc3738e8857f5981eccd608c4b29b22fcdf"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-149-0-linux-amd64.gz"
      sha256 "837f9b44132507fb7697d8e65d25fb2f274e8dd54904b4e4310c4442c3b5b736"
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
