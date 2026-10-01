# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.58.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-3-darwin-arm64.gz"
      sha256 "628861be61779448e0c985784556bc0b6d870712fd733b776f030c7989a37f4d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-3-darwin-amd64.gz"
      sha256 "3bd9f68ca287d2803a5cf0d147ef8514f67a6a6790e179e070cb083214d9c7c3"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-3-linux-arm64.gz"
      sha256 "a75b47ee9b47e56f7725775c2b5b4f15069f6da9da03ce49a679184de813593c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-3-linux-amd64.gz"
      sha256 "3e8cd537aabb457584c5aac7ec7cfa5c1fecbf2fcb8da39efbe51fafcc89be66"
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
