# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.95.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-95-0-darwin-arm64.gz"
      sha256 "b4bfcaa4fa7f726c0b6f9aa0ccedfa1fc10c9de38a3f42e3000812f208d4aab7"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-95-0-darwin-amd64.gz"
      sha256 "bfb6d6456fa11d7cf281bd3a194a7cedb2e778d6c370eeef046b4a2d30e3071d"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-95-0-linux-arm64.gz"
      sha256 "51696f27c0c68ba2129c9bd23570781ecfbadcab5b1fa6311a1e76c9c2243056"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-95-0-linux-amd64.gz"
      sha256 "62d6aa4cfea2f196bf1613bde42ecbe268d2d2005189062e45d7f9cbc64f0cc4"
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
