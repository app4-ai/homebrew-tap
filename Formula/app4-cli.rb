# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.131.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-2-darwin-arm64.gz"
      sha256 "89d53d03f9d0bec6b89b6a73d4b9246d4dc8558343ef54336446b7761ddff11d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-2-darwin-amd64.gz"
      sha256 "00e917ab40a958b6c764f7f83fe00259592795b64c50ca43a56b3ed2e58f6891"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-2-linux-arm64.gz"
      sha256 "025bd8c43f7c28cd0b009422b798b8f4a5366e62983f4d785b9c034a0cda44cb"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-2-linux-amd64.gz"
      sha256 "45dd93cd8261014cfc855b8cf504444f419761342b38793014eb38dc9c5212f2"
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
