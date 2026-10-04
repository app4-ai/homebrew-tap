# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.64.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-2-darwin-arm64.gz"
      sha256 "6f5bb3e7ac4d0df937a1ef2f17325a93f0e9fe93d9700b9f3049e4f0100d884d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-2-darwin-amd64.gz"
      sha256 "b58c09916447bbe97593bbf5486dac3f18bd9e3514fd3d271c20bfd34c0c3764"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-2-linux-arm64.gz"
      sha256 "4f044c08e9e6ab342d74af90e0a76d14c01b786c4bc19772a3f266e9cb7e3815"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-2-linux-amd64.gz"
      sha256 "a18f91e439f78a6fb08aaf86e2d833df4d0e1d72aa3b64a0f11232c1a36a6fd4"
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
