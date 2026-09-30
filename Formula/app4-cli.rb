# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.55.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-55-0-darwin-arm64.gz"
      sha256 "e4c4f8b68524a1510e28c58350859bca4c6056b0a23be9533aafdeb7813496d2"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-55-0-darwin-amd64.gz"
      sha256 "1554b0b2940b4c068a409959cbcbd807762be9049855c7e015dbc70af30fce32"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-55-0-linux-arm64.gz"
      sha256 "d311b9fd81842533d197872f22332df24a3e5e9e939507b8264368fcd15e4cce"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-55-0-linux-amd64.gz"
      sha256 "870ec954cde9f67a69a2649d5a5f7e1670d4f828b1a6753611cb5be88eb45be0"
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
