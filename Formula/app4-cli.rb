# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.43.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-43-0-darwin-arm64.gz"
      sha256 "3d0f621893c35e1b534b9bfb95a0610c708546f06cfcec50b957a234c0e83a37"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-43-0-darwin-amd64.gz"
      sha256 "1eaa2474b7835a7adc47675b8f2c0c33957097b14a56bdc0a01dc45d5c46da0a"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-43-0-linux-arm64.gz"
      sha256 "31031f84696a6fb6b04ffbd45613e1705179b3fb737f60e74c486be270ab0125"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-43-0-linux-amd64.gz"
      sha256 "399b2ef137e411da36de0179e0da5ad7dcaa2b0c7caee9e29bf41b65ba9bfde9"
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
