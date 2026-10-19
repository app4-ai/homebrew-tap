# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.102.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-102-0-darwin-arm64.gz"
      sha256 "027ad1d1d9f00bd1828960b5470bc7d289013d8e025052c3ddcc86874eb5b725"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-102-0-darwin-amd64.gz"
      sha256 "4612bc83f4f347eb8b84eabf63eed20670ec94d7fae82ae23681f66de6e457c4"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-102-0-linux-arm64.gz"
      sha256 "cf32bb6e233fa1a83fed2e60dde18be0495f5bdd4da07189c79e7d38455a7411"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-102-0-linux-amd64.gz"
      sha256 "2d7838b71cc4be28d74daa06abd85cc98945bbb25087252d098fbe4a9b080a92"
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
