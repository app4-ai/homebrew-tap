# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.105.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-105-0-darwin-arm64.gz"
      sha256 "a8b67f8bb85fb80da4900d396833d53cd061e68d7ce2f90c855c4556cdc85e9c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-105-0-darwin-amd64.gz"
      sha256 "84eb5578681ff635f796a14bd1bdc9720d9d918f004bc45fb176a6d790aad506"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-105-0-linux-arm64.gz"
      sha256 "1e3046d589781b2bd80e5509855b9d3d9dd11ae2c05f6f697d83c12c41ff5397"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-105-0-linux-amd64.gz"
      sha256 "2e55e8c019a92f999d88b3c8826b25864c1294063a62b2ee4b6e593f9378826d"
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
