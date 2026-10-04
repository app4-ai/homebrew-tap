# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.71.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-71-0-darwin-arm64.gz"
      sha256 "256a514aa932369ffc99d6e2604c277da9adbc84c97b99d7be0773a2a1c0c994"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-71-0-darwin-amd64.gz"
      sha256 "e3a4abf3574f47b79690eabeec7bb81c09968e9a1dbeea06edae712f242c8c75"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-71-0-linux-arm64.gz"
      sha256 "344778c649d06bf009536de3a8c9faf45805012430cf10d3e217c35673c58fff"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-71-0-linux-amd64.gz"
      sha256 "580c2b4bee3474c915f8f7166956c92f5f5ca11e960694b07d4ef0030af45f98"
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
