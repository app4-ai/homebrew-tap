# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.30.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-30-0-darwin-arm64.gz"
      sha256 "3b5d901e4c41a11c59f7c52ab4881d22cd95f3c8afa5c380fb34fe909c32a2a3"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-30-0-darwin-amd64.gz"
      sha256 "e3a430b7a7e406f4ae2aeff582c994a78d94fea448af78342d0193a4bbdc081c"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-30-0-linux-arm64.gz"
      sha256 "be0057d939df47030d297fc09f0391882c3e72fd8332a41ca2c83986c50c9afc"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-30-0-linux-amd64.gz"
      sha256 "31bc863bdb668ec3c15f41a43470b4439fade0688dd19ba1b5e922164732c97b"
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
