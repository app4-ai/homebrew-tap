# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.47.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-47-1-darwin-arm64.gz"
      sha256 "10924f1589b5dd49c0a399ae80bb631e7116633f9324797e9f6717a8b0996aa6"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-47-1-darwin-amd64.gz"
      sha256 "aed714a58aece71f98284b15d0d19ebb6ddb986039bf49c4c83f46d74642e691"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-47-1-linux-arm64.gz"
      sha256 "d1315282153dea49c0302698c4706f1ffb25e7f24ce3f4ce8df6531527373322"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-47-1-linux-amd64.gz"
      sha256 "8a23e10b1bc4ea1b4fe0524e48e5fc275829a809c5c05b74cf2dc5d61f9b1e1a"
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
