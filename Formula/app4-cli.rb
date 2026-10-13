# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.89.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-89-0-darwin-arm64.gz"
      sha256 "3b61f583be77537db24690c0a00d008d3c882ca5c07e8206c27f101fd0b360e0"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-89-0-darwin-amd64.gz"
      sha256 "ed77d4d239eddb9fa3c7f0dda3b0243871048bea60998e73e78e85e5ae5b3d6d"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-89-0-linux-arm64.gz"
      sha256 "fc4272948a30e6832e2972e7e7d5b0bb0c300a237dfbfae82af475b20c44291c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-89-0-linux-amd64.gz"
      sha256 "4daf5ecc7c8b7078382e1e0ba7cfd2cb5f7bb62abc79674ff340c1443f55bccf"
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
