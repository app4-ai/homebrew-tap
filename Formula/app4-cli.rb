# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.107.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-107-0-darwin-arm64.gz"
      sha256 "97161fa789bc1748d7e17aa73fcd83cce0616f3d2bc8a1ed4d84ea400ce016ad"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-107-0-darwin-amd64.gz"
      sha256 "86062f91a05db8d10fb1e796ad45cb53e1acc66d8bb69a1d36f252b6582fc9a0"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-107-0-linux-arm64.gz"
      sha256 "8e26d1b3a083ef3c2097cf182619d386b1e16b733bb3c34e79558258c4fd540b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-107-0-linux-amd64.gz"
      sha256 "0d78aa2df930a9d60be06cb23c08eafd37128220a5b45afc6f1c62a858ad28c5"
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
