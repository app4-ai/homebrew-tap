# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.32.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-4-darwin-arm64.gz"
      sha256 "8c0076295fd8b8b2cafb8fac53e5676695dd838972f4e1bf24b626469473fdf6"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-4-darwin-amd64.gz"
      sha256 "20afb2d098baccfa3db50139d2c92036f12f7cb0ba32afaf647c26627023e28e"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-4-linux-arm64.gz"
      sha256 "c3c87f26690b2d6bedd80d622d0cf7c85bc715341fc35b68208339bb9a5a634f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-4-linux-amd64.gz"
      sha256 "89a75831f9c8dfcbbf3d3a05ff4f7a5d93af6a83cf3dea059ef3c1e441fc767f"
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
