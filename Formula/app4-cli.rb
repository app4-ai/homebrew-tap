# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.33.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-33-0-darwin-arm64.gz"
      sha256 "d7bc730888943b0278406eb88d83be1a869cc08a929698de2a3fa4f9a4a2df14"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-33-0-darwin-amd64.gz"
      sha256 "5b8d605de46b4ecbd4de7e7330a73dd070d8ff455d511058ba19efe9aefb6281"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-33-0-linux-arm64.gz"
      sha256 "30e8253ebc4b94a0d89d9f2b33f237ca48b4561698761ad4eeb1eaa931081d7e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-33-0-linux-amd64.gz"
      sha256 "791f575ba420b2e7e58b5dd2850dabdf492faea653b7a429de577e3e853d7349"
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
