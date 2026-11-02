# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.131.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-0-darwin-arm64.gz"
      sha256 "91ae00f22acf66060ae2fe3fa5bc2694d5f6f4a38d95085ce19cebb7296b0265"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-0-darwin-amd64.gz"
      sha256 "db0a9fced2dc02bdd5ba46775d6c8053db49d545000ef8a2a31606426f16255e"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-0-linux-arm64.gz"
      sha256 "7480a806754216efbb8fa4d0c0e33f472d4891663ee376edf3aa0098753aabe2"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-0-linux-amd64.gz"
      sha256 "dfcb50c33a75e77cd94a5c3d48b58ebc70d645914e6fe9a107d9882b65af6609"
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
