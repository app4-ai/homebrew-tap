# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.90.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-90-0-darwin-arm64.gz"
      sha256 "124925110c36be22ff3ecbb47331f302ed99eb130797b73815986769b43c0113"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-90-0-darwin-amd64.gz"
      sha256 "64a911e97156fc17eeef3dd47aa8d18cf822eae2ad5b658f59d1db2dda659fcb"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-90-0-linux-arm64.gz"
      sha256 "5382757592844673a019120ab4fbf9ce7b8204738bfe5e4869caff4421b46e7d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-90-0-linux-amd64.gz"
      sha256 "6520c61da4790ae0a1666a82c5bfb31e53d1a67517ee1374dadfcb6c7e732f09"
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
