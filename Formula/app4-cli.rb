# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.135.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-135-0-darwin-arm64.gz"
      sha256 "6c95996d464694a49eec5f52fd48cdd671c8fc5ff9843684155a75f83f259301"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-135-0-darwin-amd64.gz"
      sha256 "52b52e830ad05a46cc18c80f53eee75c5c510688592bf6faaaae69fbf6f43994"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-135-0-linux-arm64.gz"
      sha256 "03f8ea2822afdc28e6402c1a103fa6c7111e130c8aec86907dbad07b44805cf9"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-135-0-linux-amd64.gz"
      sha256 "33d600770110612f32a33944d34b90c902e7bbcb5bc111d3688ec8db09d8bcfc"
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
