# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.28.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-4-darwin-arm64.gz"
      sha256 "60c0f7f0e6bb14f588326fb90a8b6f3ff1256f690889dc8798046ee2161bfd51"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-4-darwin-amd64.gz"
      sha256 "822ffb7dfa30ce1135073d044ccaa9610ded86e3c19def14f38d43fb8239a384"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-4-linux-arm64.gz"
      sha256 "02ac89d7eccc419c51de8360641f6bbb4204adafe30557de59dbe30c62ff14d0"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-4-linux-amd64.gz"
      sha256 "745facc6a486a97b6160f44a4a94490003261a1b62f13aca88b540c52ddde097"
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
