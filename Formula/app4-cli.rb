# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.116.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-116-0-darwin-arm64.gz"
      sha256 "b9ac10bf967a8918d688da4e726c77df3ee01c937171acbfa80ed1302f5b96c5"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-116-0-darwin-amd64.gz"
      sha256 "61d6a97752bba328acceedc3a7b9182e375e5e7a9dfefece37760430f59d6656"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-116-0-linux-arm64.gz"
      sha256 "224c0289edee045d045acfc1279278986818a98ba6a9b3a5748595bed45b81ca"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-116-0-linux-amd64.gz"
      sha256 "456c0d2aa5347b58d220624e2d946b2b555d191002482cf18a3e0203bc8bd781"
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
