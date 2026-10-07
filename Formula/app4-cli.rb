# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.76.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-76-0-darwin-arm64.gz"
      sha256 "ffbd302650f43cd7fc924af7dc30802d766dee963e880561e9230c0b6b30b40f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-76-0-darwin-amd64.gz"
      sha256 "1180775fba8b1a8558b8347227347024ef1a71547520cd836b235cf2517bbf37"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-76-0-linux-arm64.gz"
      sha256 "d77cf015e86a73db67b00d8baa003024c6e4d7aba4a7ac4913d7b48a348688a2"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-76-0-linux-amd64.gz"
      sha256 "5d880e74c82f523f9e69bd6430b645a0c0b1ce962139a2cfa3cb336e2a4eac0c"
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
