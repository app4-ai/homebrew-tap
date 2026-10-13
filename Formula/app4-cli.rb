# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.87.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-87-0-darwin-arm64.gz"
      sha256 "2ff1e359b4bf1dbc63204df0220bc0716d3d4a9c18f2994b83dc39fd5b5e4f15"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-87-0-darwin-amd64.gz"
      sha256 "b539d4933ab96168bb035a86efca3532bd631c777fe4f181187f786c990147ce"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-87-0-linux-arm64.gz"
      sha256 "f2aa0317aaf5a5c6e0f571df61a088716fac4394c94746eb9399e846d22b90c8"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-87-0-linux-amd64.gz"
      sha256 "ddf1e57847919889aaf5b1724bac2408f56e2f67c9edfad196ca702a8308a8ad"
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
