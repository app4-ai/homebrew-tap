# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.134.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-134-0-darwin-arm64.gz"
      sha256 "1a6584d564f7a3a9b928b9f61cad9790dee8172233302896adab69bf202f4f36"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-134-0-darwin-amd64.gz"
      sha256 "97f2d7fbe674300625482c0acc9a667bb5f7b7dc3b582268161c198850cf1897"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-134-0-linux-arm64.gz"
      sha256 "421b55f090a2022d1755a1eea93ffb68d40e9aaf76883d5046c26509dc5284ab"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-134-0-linux-amd64.gz"
      sha256 "d122bd88fb71893103af462d2e14c28059dda4e9cea05cff6a0228475ac2f326"
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
