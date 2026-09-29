# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.49.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-49-0-darwin-arm64.gz"
      sha256 "b589f10b9c64b266fef9e642c2e7602d64ec14d7860a699ae2fab7e4fdf5cb49"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-49-0-darwin-amd64.gz"
      sha256 "3a9dbd1516707a177c2c5df0b61293c6440dfcd6c7e6d60706da06e84f1ad77e"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-49-0-linux-arm64.gz"
      sha256 "a6b2a844338bffab5dbbc05721d8f0c1391f3f832d278ef1a3e267deda79e439"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-49-0-linux-amd64.gz"
      sha256 "8b1212a71a2810afd6fdba313d29570a34bb74402eb81b5edcc0f9a02960db3c"
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
