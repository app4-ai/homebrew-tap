# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.132.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-0-darwin-arm64.gz"
      sha256 "de8196e4227a3c9232f8e6418030f978e059b269591733e3490ab59c71720bc3"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-0-darwin-amd64.gz"
      sha256 "f8a44428d33ff57c06249d734233d39f7af8d0542ffbe2d1d93344f625d0f9e9"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-0-linux-arm64.gz"
      sha256 "cb0ebc77e358741591b25a6941e2b47fd774040e98bc7e2e3d688f3b831aaf46"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-0-linux-amd64.gz"
      sha256 "880ecee687c51788a3db9de2092d06318126d273aaa6476e26c561047ee3a33b"
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
