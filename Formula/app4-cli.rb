# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.148.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-148-0-darwin-arm64.gz"
      sha256 "d97d90f1fb4ce02770c043020ae93adc376700640594a72dc59d73cb5e665a87"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-148-0-darwin-amd64.gz"
      sha256 "3f8bab93c057e173b350c6a081d4b267b3c6f98335e1eebb40af8889ae4d7ff5"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-148-0-linux-arm64.gz"
      sha256 "195b2aae33cb5123e14b8d9d8e6a533149172fc85c97879c4c68eb9a812ba0ae"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-148-0-linux-amd64.gz"
      sha256 "ae31ecf7f8544fc6ecf320a5d3e149d5ff176983eb4439b35d8bb63551863f7e"
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
