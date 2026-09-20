# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.37.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-37-3-darwin-arm64.gz"
      sha256 "ddd296d1055f6cd07c9b54ff8e7dd9f2b31882c91846990a655dbb27a6ff4004"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-37-3-darwin-amd64.gz"
      sha256 "bd3f99e68ffada968395dcd56915f770f302eaf9ddb72cd22998289fad874a3f"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-37-3-linux-arm64.gz"
      sha256 "3abed50548e5b02a1974ab74b6705f679f7f18ab42a00dd2097d07877c27e5d5"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-37-3-linux-amd64.gz"
      sha256 "38458bcdff977dfda19ccc808a9d5756244c037e1c8505f1e174ea81e7959522"
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
