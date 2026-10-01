# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.60.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-60-0-darwin-arm64.gz"
      sha256 "67625ec70b8307718a76a6e12261d8b0ec5f7cb5d89abe955d3063d28b6ab0ff"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-60-0-darwin-amd64.gz"
      sha256 "dfd43eeda8657290ce2ab4e2a0e748fd2791ebf241a5e0df363c720df293ab64"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-60-0-linux-arm64.gz"
      sha256 "311d45a0011c575dcbd005a1162875e5bc807c10da97cf5c5442bf57a051ee87"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-60-0-linux-amd64.gz"
      sha256 "9c744b709d514f7f77f647a99e9bb4f9b09acb979222f823072033f3fd9e7cd2"
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
