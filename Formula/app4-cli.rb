# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.150.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-150-0-darwin-arm64.gz"
      sha256 "e07ce5d73587ffa099a6c1b90874fb896336eb7a6b8556aed1c115e7f04e7626"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-150-0-darwin-amd64.gz"
      sha256 "d71ee6e36c2fb2ae3bb7df3a89fafaa07de4c57588e0c6535a0a17d5393bd19f"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-150-0-linux-arm64.gz"
      sha256 "eaa125c9e88228d6f1098ce6472c7d5f3db02109993360e0aa3085352c2c4f53"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-150-0-linux-amd64.gz"
      sha256 "1195721be1a5e54c70b6fa4cf3d12444e7144822e21dd1234a56a81dd935da52"
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
