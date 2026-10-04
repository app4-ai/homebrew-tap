# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.68.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-68-0-darwin-arm64.gz"
      sha256 "79e374b1f45192870fb0286663203ad2abe8d47e57a3295f5f81d8e6544da62a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-68-0-darwin-amd64.gz"
      sha256 "abe3007b9b92ea2ba9efdd49d9dba0c2a7ac35572536f3d003441d05848222bc"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-68-0-linux-arm64.gz"
      sha256 "c9c282c0a000d449a1b15808996565e6fea35123566b17cad87225310fb7138a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-68-0-linux-amd64.gz"
      sha256 "34b5450927cb69cbbb75d4a7dc79ffb63df1bc5ebc85239b79d8b04570c74a60"
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
