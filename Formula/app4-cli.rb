# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.99.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-99-0-darwin-arm64.gz"
      sha256 "f39b083c8c30adfba130d2b12dbd20022003937b4602439e60f99dcc68221e41"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-99-0-darwin-amd64.gz"
      sha256 "0ba6224f7ac51807ecef95346fee6c9b29ce18ee4b680114475e8364fa779f53"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-99-0-linux-arm64.gz"
      sha256 "e3abb248788f398f5545ccd8a97f4dfbdd3e9ca8571ec1b09a6dc300b4057849"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-99-0-linux-amd64.gz"
      sha256 "5e7fbbe84e88f485790811736bb6f26cc785776537e85823b2d9438757955262"
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
