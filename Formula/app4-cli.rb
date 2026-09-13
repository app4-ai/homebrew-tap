# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.32.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-2-darwin-arm64.gz"
      sha256 "20df8a172913a3506202c73acfe0fc943305f71b81b8d74b93a082fae88a9b08"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-2-darwin-amd64.gz"
      sha256 "a3bea5ba7c3d629fc803eeb8aa3056043fdd3046d972ed5471fe12735ef91113"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-2-linux-arm64.gz"
      sha256 "e32894ccc71bf89ba2fa1679ea1513891c8854fb964463081a6886a358a9e016"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-2-linux-amd64.gz"
      sha256 "e98edc7d3772a022eb203d6ad2cdbe4de487f0b6420346ad0d694298c80734ed"
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
