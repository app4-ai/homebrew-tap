# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.36.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-0-darwin-arm64.gz"
      sha256 "9c02935e5503d9c015b569a7475bd519c4cebf790c63d23c0c47f8b6b7f0d48c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-0-darwin-amd64.gz"
      sha256 "4a3f4f5236c0eda172088987a0a9d0cdd4f5d1ea392fd1bdbde7bd6d38050617"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-0-linux-arm64.gz"
      sha256 "de034c3d64b199de66682a0045d965a3b608cf3e26c0fbf17d69b6d58847611f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-0-linux-amd64.gz"
      sha256 "e95ef5023fb5c11d11526db232f335f393478f1e49cf89acd2972a458d248e16"
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
