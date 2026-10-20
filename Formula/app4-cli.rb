# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.105.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-105-1-darwin-arm64.gz"
      sha256 "4fe05b76bf18258a1767d88e36225bec03e8fb2189330f668361f63ba1de0961"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-105-1-darwin-amd64.gz"
      sha256 "4285396e0b4c88fbefd8be91742a31617b3a5663a5b5369e859f5871f44790c8"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-105-1-linux-arm64.gz"
      sha256 "990ccc993e7940118d78885710e31477da47b9bab4e6f2aab79220eee886562a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-105-1-linux-amd64.gz"
      sha256 "4bfa4266e91d0149161df0b6d2f94138a5d09a9ccf2625950f711dd30753484e"
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
