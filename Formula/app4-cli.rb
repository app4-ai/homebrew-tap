# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.96.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-2-darwin-arm64.gz"
      sha256 "92a176ec7bb32f95e381356dffab3a105a443fbf0bbfac600af1393c06e6887c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-2-darwin-amd64.gz"
      sha256 "159fcd8a8d34de96c2c5f6f9b1ec34b86b92932971fa460e4d9f6d74825a0008"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-2-linux-arm64.gz"
      sha256 "8968f88c6c6f81e91a9b1365b6c0dfc2cf10b4e1e4cd0cd70be8169bd4a5c5de"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-2-linux-amd64.gz"
      sha256 "b06473bf83995a6070be835b2916d121f34b7ccefec88451728096a3e2a30d27"
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
