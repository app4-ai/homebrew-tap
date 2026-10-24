# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.112.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-112-0-darwin-arm64.gz"
      sha256 "4ed25eb584badc85e0bf3e137d123ee0c6d4197f056cb171941f7940f9c2fc97"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-112-0-darwin-amd64.gz"
      sha256 "d7056cc4560bbe1ee15eeaa9799b3eaffa3421d778dad7d44de9a517aa198600"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-112-0-linux-arm64.gz"
      sha256 "e322b67d1ee45ae0d65ffdaf1f3afebc2403629f2e8d025d0c2214844dd75713"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-112-0-linux-amd64.gz"
      sha256 "488d88f47a03b18b7dd2b9742172b02fd4941e8d194229f3d070fc377372c5fa"
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
