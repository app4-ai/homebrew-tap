# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.28.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-6-darwin-arm64.gz"
      sha256 "7006c52e9f9d4a3ee3f2744cf134857f41fe1f5408235a1fa61c994a25246b8e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-6-darwin-amd64.gz"
      sha256 "88c6f1834f35f3e5a837d0e0237b2f56fdbc81b0679be7cfe92c8cbd2a2b2490"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-6-linux-arm64.gz"
      sha256 "e5c1f4eeb63a834d27d33aaaecd65a40562037055039a8e85a600482e24e9ae5"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-6-linux-amd64.gz"
      sha256 "89cbe518a00c64f6965d084504b75dd16f13ab4c2549c503c6c9bf9544a88259"
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
