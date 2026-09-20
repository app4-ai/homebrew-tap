# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.36.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-1-darwin-arm64.gz"
      sha256 "de006b3a1309e69e64cc6a4d7d2d6a1374c381ce6dee6d5993385984a8f7b5b3"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-1-darwin-amd64.gz"
      sha256 "a5ef45bd2e6923272a8565706acd50cc8c46013429afee55b78b1e3b1be72ad8"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-1-linux-arm64.gz"
      sha256 "3052cf41f91f3bec6155acf33d2f2c58dd5ccb7530904eaa7aa6fa8af5f054c8"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-1-linux-amd64.gz"
      sha256 "65b6b362b5c4df08a08592b174cf1db332f8089a621ed4aa59427836cc0e4507"
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
