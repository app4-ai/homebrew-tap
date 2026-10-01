# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.59.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-1-darwin-arm64.gz"
      sha256 "4613f41a8c6a92aad9d7a56cb601d18cb267e2153226f19173df9dbc4ededff4"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-1-darwin-amd64.gz"
      sha256 "d4167c607aecf8b38626c8464148fc5879fbad19f7a2cfd7ba555b7010a890df"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-1-linux-arm64.gz"
      sha256 "c35d2b41c80b98b279509ef41bcef3f1b54a1d27d4c7b597ea985dbe45b34e12"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-1-linux-amd64.gz"
      sha256 "7400ee66bb750ded6092b6742fbc8e8c1eabd5538fdc5bb4c5907c8e9380e7f8"
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
