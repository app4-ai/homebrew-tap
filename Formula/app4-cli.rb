# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.132.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-1-darwin-arm64.gz"
      sha256 "3b005b51c97657d8d2707a3ed74f259f900c2d9ff32616dfee3a5220be36a784"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-1-darwin-amd64.gz"
      sha256 "88c6dbe67ff1b3ad6eb2a4b641277bad5c5e28075d971e6d63f5b341905a0cb5"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-1-linux-arm64.gz"
      sha256 "277b82fcb99390753acf220f4e16abf7c9ff01cc16fef4c4ce60eff19c064f20"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-1-linux-amd64.gz"
      sha256 "f418d98c7a2734e17947fa01d5a75d69ec99c65c36570d0e598323f05780e6e5"
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
