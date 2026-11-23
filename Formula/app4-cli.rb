# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.144.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-2-darwin-arm64.gz"
      sha256 "eddc7a39a0233718d4a7be86d6d9f11d49a2ff7771a6bf7580ae5bd544e8d759"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-2-darwin-amd64.gz"
      sha256 "f88ab6eb7d1b553922c5c4a7dac8f42e7b474858a14cb4a1a617b07c87ece3a9"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-2-linux-arm64.gz"
      sha256 "67f9925f8fbcce6a1cf9805841994b2a3e92af2a56be0a2d93585bc60506e78c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-2-linux-amd64.gz"
      sha256 "230d692b3731553da08795d31b4101a1c4e9a0f8e703dc21fe3adbbfb6095611"
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
