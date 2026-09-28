# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.44.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-44-0-darwin-arm64.gz"
      sha256 "19b78cb1dcae5fbd53c228cc29bc4a6d0ad2274950e974bec04132ccf68b8d24"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-44-0-darwin-amd64.gz"
      sha256 "f9a935b86ed55872e7a1aaf5ddf197da49c6b73501643b452e0a6e55b44c1eab"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-44-0-linux-arm64.gz"
      sha256 "227d89ed22b7a7bc687445b00227666b82fd456a6d7f7e21600fa83d5edb3ac6"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-44-0-linux-amd64.gz"
      sha256 "862bde0a6cf12d35dbca66786df4b46e82651759d37959ad32e0b175a3ed92d3"
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
