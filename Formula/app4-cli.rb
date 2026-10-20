# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.104.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-104-0-darwin-arm64.gz"
      sha256 "e56091bca0d351d4c16ac3950043134ae3fe52c3907387dcc84f53f92a1d0fe4"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-104-0-darwin-amd64.gz"
      sha256 "9a5645b576e9caa3aec3dea9fb9cd0f2bb4b82be9708cfca67ac216e7d2ec42e"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-104-0-linux-arm64.gz"
      sha256 "ef0fd7bad34bd58cadabd89f7064ed39760e3f429a77c42f75a462c28123aa5c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-104-0-linux-amd64.gz"
      sha256 "6fe8b0fbfccde3ca05574eb4d0b3b561369201a662ec9a0fc0cbdeed4acdc6f8"
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
