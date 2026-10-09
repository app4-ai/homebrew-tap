# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.82.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-82-0-darwin-arm64.gz"
      sha256 "8386562a3ce9b6bf35f1928fed2d3eefe39d83792588fa2c201a9e7f33b4c0c7"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-82-0-darwin-amd64.gz"
      sha256 "504c43d02f6ce5954859b25f690c7afba5302b112aa1e269a0c203d54da134a5"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-82-0-linux-arm64.gz"
      sha256 "71a8eec976b8984a699ae1a468fd617e1768adc29387464da46b06760e22c4f1"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-82-0-linux-amd64.gz"
      sha256 "924a8d7d5c8421716f40160fdebd84665e7397beb060c301f0f27ea65d2e0c57"
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
