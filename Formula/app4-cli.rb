# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.115.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-115-0-darwin-arm64.gz"
      sha256 "c8488566b13584f87226a2c3a097ed7dbb23c325eda776ee09d80f4a25fe4ed5"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-115-0-darwin-amd64.gz"
      sha256 "c34639828ff4eae744df8938a7227ceeb49ef0c55cf32a714941e7ad01f568b8"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-115-0-linux-arm64.gz"
      sha256 "5c822ab67c54a5fa6a52659b8f0a4c146e7ebc2af479372c22b54ee295dd2ea1"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-115-0-linux-amd64.gz"
      sha256 "1e7f7b299d2a2a4af9c7fe552eaeefdcbf64d031e429345bddd7b51c760ef283"
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
