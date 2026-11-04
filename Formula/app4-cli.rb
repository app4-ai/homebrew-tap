# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.131.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-6-darwin-arm64.gz"
      sha256 "7be3f55b36231aea8452f6afb7ab4b4186d0c0e744d014dfda00ac9fcd05cb02"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-6-darwin-amd64.gz"
      sha256 "8209ea1aeb2710804289b03868064dfc875cb5cadbff0ce762e4d19ef1cb12c9"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-6-linux-arm64.gz"
      sha256 "060e2509051706a11b2723fc7b4fc18a17ae2e20590ea83f473a01733263cdb0"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-6-linux-amd64.gz"
      sha256 "8610bf58c3081df6ed8782709510bbbcc85eda58259c03ac5c553b6bd77ad5a5"
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
