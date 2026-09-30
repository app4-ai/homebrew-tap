# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.56.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-56-3-darwin-arm64.gz"
      sha256 "81759704abd2978767ee1c36084893739c0015137936034669f83afb7724a121"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-56-3-darwin-amd64.gz"
      sha256 "4436842fa52d949dab908e38c4e980db1721d8d73c3ee6e56eed29f8bc101be1"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-56-3-linux-arm64.gz"
      sha256 "0fc4a9969ac0e21309f3bf3b91b51eb34445e48c11306e7ffe4a4f07c20cc7f7"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-56-3-linux-amd64.gz"
      sha256 "85163a3e78eed44a2f09fe950d011d256a4029a894320fc23d8cb9b9266d5b6f"
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
