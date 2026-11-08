# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.132.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-5-darwin-arm64.gz"
      sha256 "845b9c74cee8536f7e843494b91cb7f1f1664ac2421acd205c10c64450258e9a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-5-darwin-amd64.gz"
      sha256 "f178649b3bc9e86adceaa3634839a541a02059cc4d892ec4a0d2230c8f079ecc"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-5-linux-arm64.gz"
      sha256 "124bca5723bb86ac70a7dafd67a20f10f7de35f02a16cdba3864840a84015929"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-5-linux-amd64.gz"
      sha256 "dbe70b8add40c7e1d9b4fe917f189832e7ebf8f1aca0c09857dad8ecf652ba8c"
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
