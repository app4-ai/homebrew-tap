# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.110.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-110-0-darwin-arm64.gz"
      sha256 "cb6f85c7187b5a24ec4ecf0d2ff6fe6b754873d61dc5f65aa2b357b0046e26e1"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-110-0-darwin-amd64.gz"
      sha256 "8f5a1e1027af1c1b81c741611780b1034768ba56bcf1473d3c669fd315aaa3c4"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-110-0-linux-arm64.gz"
      sha256 "610426dfaace28841f158bdac9b834bce1f5d7c90dcfbd4d4002c45876c31d49"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-110-0-linux-amd64.gz"
      sha256 "74b242fe12b1bc7080cc0931703889d8cf8d4b0d7b678cb7e66e863c302f16a0"
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
