# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.93.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-2-darwin-arm64.gz"
      sha256 "4f2f02076e664bab6d862240f6aa0a7f71d6e664a3f9919553cd9e12e93daa7d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-2-darwin-amd64.gz"
      sha256 "184917cb93d5fa1d75b70dd625265ace596147f3f8f01aae67845cfd0268e37e"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-2-linux-arm64.gz"
      sha256 "c771151c3ff98537ec332d1dc240290e27cfb19ca15a87c60b762a01fc2d0df9"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-2-linux-amd64.gz"
      sha256 "a5021128982da5dc7b2c272486fc0fb2be53f0762ce53c4c8b3c7a8ac5bea034"
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
