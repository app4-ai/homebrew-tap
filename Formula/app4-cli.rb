# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.59.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-0-darwin-arm64.gz"
      sha256 "f6f339c3e7f4c447649b8629aa4847f63b93466190b03ff6fb50b6f7585c7175"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-0-darwin-amd64.gz"
      sha256 "43124b852e372e56600c96b002cc84686d61404333fa913afe8dbcc6562c9350"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-0-linux-arm64.gz"
      sha256 "debe66dc4d75cf3945cc075b825f378d1c3950f1aa5c01e05cc2f0ffa52f91b8"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-0-linux-amd64.gz"
      sha256 "0f67ff31c4b46ce6865c6f4dbe66bf32d5f6fd3a395a55cde3e06a51bc243e6a"
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
