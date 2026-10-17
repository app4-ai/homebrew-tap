# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.96.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-1-darwin-arm64.gz"
      sha256 "2bba559e0a4450a14ce00f58edcacacc48e4b39bad02083e197bc23a06cf7254"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-1-darwin-amd64.gz"
      sha256 "bb1ae7f03f1d548495b60ca1a0b04338ffef30d2b0cc45fb23964d19e1df4a0e"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-1-linux-arm64.gz"
      sha256 "0a37b35b3e0736d3136816662700d306368ba31f959380992c9238660b176b0b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-1-linux-amd64.gz"
      sha256 "6de33b74cf0b0f74298caf092e6471f17407e002f9142da0efeb5a51a177fbd2"
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
