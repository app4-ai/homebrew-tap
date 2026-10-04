# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.70.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-70-0-darwin-arm64.gz"
      sha256 "39f1977895cad2b439b4db21fe3f129b5769ce57aa38141794973ca109109af7"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-70-0-darwin-amd64.gz"
      sha256 "a8113a7a39c1cc6be60c80bdca901bb0a34164706fd2afb5aab0218cb8ed3c4b"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-70-0-linux-arm64.gz"
      sha256 "54a5ef9ad5fd371bb10d8b842b078fb43465fed4e59b55570c255e6435b3e283"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-70-0-linux-amd64.gz"
      sha256 "9cb34507a15fe1609fb35882a7861debe002c1448dcbf794719eea080d071823"
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
