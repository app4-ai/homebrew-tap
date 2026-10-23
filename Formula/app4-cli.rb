# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.111.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-111-0-darwin-arm64.gz"
      sha256 "0afa00832017b76441897cbde3ecdd7cf0db45a8441427668d33f21e27ece284"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-111-0-darwin-amd64.gz"
      sha256 "90cd273d57b155b873ac805f121bcd86920288e802e2dbbdff5b0e881ec37c47"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-111-0-linux-arm64.gz"
      sha256 "1a7a49d3bd03fcc93c25f69c59d8a830e2e1fd0302cc6a6bbc7e33973597793b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-111-0-linux-amd64.gz"
      sha256 "eda339ecec7e4a2c2a9a126bc8b7240bfada435d2a9b03e6eb91ac7a3d389282"
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
