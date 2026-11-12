# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.136.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-136-0-darwin-arm64.gz"
      sha256 "871c7efb62921dbf3c6157cf58bb72be643bb1dbcac4bdc1b735d0d3c50e0077"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-136-0-darwin-amd64.gz"
      sha256 "c2b17d10798e7bbc91ce2ce48103bc49e87cdaf011f7dfc7a39c383c43a0824a"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-136-0-linux-arm64.gz"
      sha256 "a5a79fa0b94e1380009f4149ff89ba8d3a4db254a6aadb6638fe03e6a9704c86"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-136-0-linux-amd64.gz"
      sha256 "d6fd5eccda9ada7df04b8cef908f9e61b68c2b0b44e9a05a9ff7e0e4b67f2ee2"
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
