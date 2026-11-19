# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.140.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-140-0-darwin-arm64.gz"
      sha256 "b11904dad65159146f737cdda7994b5d330475d6e7c6172549ca8d0fa044ac10"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-140-0-darwin-amd64.gz"
      sha256 "aa52a2ce2f5226f5ba451a0f5ccbeefc943450bfc4b263f112170908e00a0cbb"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-140-0-linux-arm64.gz"
      sha256 "7f9e4cde1b7babb9b1a2589b0b31ee87d9a715f7dcb1a5e0c3e6876db64135bb"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-140-0-linux-amd64.gz"
      sha256 "4c3428de74b59b9498869bed4717a4654eeba71057f28a4108b6e41c12cd55e9"
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
