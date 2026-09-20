# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.37.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-37-0-darwin-arm64.gz"
      sha256 "2c4778f0cf6e79ac595bf9a6f252bd23fdfe462fa8eb65cb7b9971a7cb851091"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-37-0-darwin-amd64.gz"
      sha256 "cb23d2b0849647c4511aa9c9f0ef763d4df4bba54ffda196608c10e9e1a824c0"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-37-0-linux-arm64.gz"
      sha256 "319a028df95c78641a934e6bd3bd1789fc644b07a26716074cb1bfc8e859f78e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-37-0-linux-amd64.gz"
      sha256 "19386cbe7bc92dab67cd5abe523ab65d2f29df06271d1db1b23c839d29e9d42b"
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
