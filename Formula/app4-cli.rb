# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.47.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-47-0-darwin-arm64.gz"
      sha256 "db9b52d488b8b977f21f19587c344f154da082fbf86923736dcac066419bc95d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-47-0-darwin-amd64.gz"
      sha256 "315935cdf5ab9e0f8e7c49b1e33a6d96fdecd13dae437f611d0b1cff5eca34b2"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-47-0-linux-arm64.gz"
      sha256 "289c53d46495b1596498ecb1e65a71e70fa6a477f01aa831a83b96781821d02e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-47-0-linux-amd64.gz"
      sha256 "a1915f7f7ac131e8ad145b1c742b87fdbb5a0e6254aeaf47e3e86e586d13afc3"
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
