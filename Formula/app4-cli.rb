# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.114.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-114-0-darwin-arm64.gz"
      sha256 "1e9ec6f3fc5ef75c0fb7b27b80b002f0e3e343e42ddc995888fa2762a464e05f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-114-0-darwin-amd64.gz"
      sha256 "0b39a571a559408690c00c3eaa038dcecdee1f131656eb9f001876b4829a27dc"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-114-0-linux-arm64.gz"
      sha256 "565047ce9d7a244ac7c54048b264759cfeccfb1045518895db062b561710aa1c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-114-0-linux-amd64.gz"
      sha256 "dd97cfb08e2a4a0cbff0e9206fbff5ec2e786573d4a550d315f42c8137ffd145"
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
