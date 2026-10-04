# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.66.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-66-0-darwin-arm64.gz"
      sha256 "3cbf8f69a997830eb87241caa7210d3588cc5cd8e01e079381d750be95df5cfe"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-66-0-darwin-amd64.gz"
      sha256 "b762867002d1133979301b2b14ea4a12e7849f06ae2d39adf622b0f65cc83c9c"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-66-0-linux-arm64.gz"
      sha256 "6cdd14853f449e8aadc85b6a927cd3acccf6a1b071687c172e8cb9f0c09d38d7"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-66-0-linux-amd64.gz"
      sha256 "9e237763bed70cc375640d8674696ce86a981dbc903a00ce134a265a987ad060"
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
