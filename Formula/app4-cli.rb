# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.68.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-68-1-darwin-arm64.gz"
      sha256 "79dd954ed9269b0cb2389dc251efe7c95e05dcdbd38fdb56f105a000339826ef"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-68-1-darwin-amd64.gz"
      sha256 "bf9584b9063e856b34965e628167061ac51b32064a8de0587b99d0bf0900981b"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-68-1-linux-arm64.gz"
      sha256 "6a623fe1e3b2854c60f3839ddfd8698505aee676a7f7dd0ff06dabd5c5692d96"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-68-1-linux-amd64.gz"
      sha256 "63be56e63273b18513a7553e31649f4f386920a978b6a0d6603e9d4b2e22dee3"
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
