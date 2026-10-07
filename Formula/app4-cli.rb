# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.75.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-75-0-darwin-arm64.gz"
      sha256 "423642d08fe868cd2e366138804cf348e63e2e48afea5fb17e5a8f2469018de5"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-75-0-darwin-amd64.gz"
      sha256 "40998207915ada77a3fc4ba5a6257b5df3343384fa3a80373591fe50d6ba337d"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-75-0-linux-arm64.gz"
      sha256 "3efaa83f94f729781a3280abe31d687d54db4d0502aa29365b6afe2cc3c35c22"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-75-0-linux-amd64.gz"
      sha256 "ac2bf99a3ca9f1aeb57d496e8d4ba490461db973e5cb26236c7761a24f1ca397"
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
