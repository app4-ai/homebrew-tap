# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.63.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-3-darwin-arm64.gz"
      sha256 "083c269c7861440f4df7a12b1ac8e28b4da21588f03f6aa521f0bb2bc76001c4"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-3-darwin-amd64.gz"
      sha256 "44d233b7dcedeeeefc09f083341f4bacd1277be2c627bb173dc84ed89a2c3fad"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-3-linux-arm64.gz"
      sha256 "eefe0d0edfc3611bb5b5aeea65351f616c163f292349bd8e4a367fa590940929"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-3-linux-amd64.gz"
      sha256 "8f5838543be54560f9fff4fac77e8016e2a9ba5cf35ba80de47630eee978ac9e"
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
