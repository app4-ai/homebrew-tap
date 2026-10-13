# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.85.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-85-0-darwin-arm64.gz"
      sha256 "bbb37bdb176862b3b4c83560e0d3b33583536d33f98f741bc417f1d366ce8a39"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-85-0-darwin-amd64.gz"
      sha256 "4214848ef4e1a750673a2c4d3f66a01d6a659d0c80a935ec649c621d9eff28b1"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-85-0-linux-arm64.gz"
      sha256 "f6528ae32e710102f867e22af320e1d243292d11006cec7ff8f95cf940f366da"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-85-0-linux-amd64.gz"
      sha256 "ba11dc2d2b23130c2100a1bf74e1828ec7b4070b48e10b2271742393b99aedbf"
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
