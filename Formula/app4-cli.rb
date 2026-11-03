# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.131.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-4-darwin-arm64.gz"
      sha256 "e25e16d396fc04e412031b1be8bfbdb199c7469d80c8a88c4a81e76787d15a07"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-4-darwin-amd64.gz"
      sha256 "e6fb46f81b45f2e7b825b00948716fbe5892b0b585ea4d1796d117f09d1ab89e"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-4-linux-arm64.gz"
      sha256 "341308183b6e2af774f656fbfa3e6a78949d9bf084a702dacce02805165f89e2"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-4-linux-amd64.gz"
      sha256 "7143914167ee5528a37a2f9ba049286fb82d5772041a1af87797733fb7b99af2"
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
