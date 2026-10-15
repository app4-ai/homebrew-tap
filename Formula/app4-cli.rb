# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.93.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-3-darwin-arm64.gz"
      sha256 "7a9271dcc1b522370cadb4473b130833b8c0e21808b3966c9919f1dc7237c755"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-3-darwin-amd64.gz"
      sha256 "6b735760ed4461c98d09bdc67dcb9e06769fcd00fd3658b78fdebc9b66abab63"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-3-linux-arm64.gz"
      sha256 "bed3b669c4c4e8dee8ee7adb08f25b58b45f39c0f083bc1bc8b93bd05cf9b9ee"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-3-linux-amd64.gz"
      sha256 "be192876a19363b1bedaae3e7350be7740fd739430fde7f9ad6e3597e7e856e9"
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
