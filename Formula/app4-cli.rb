# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.28.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-3-darwin-arm64.gz"
      sha256 "d162ba38c8df226bf2e64a99ea31b418c912cb4ed74051d538028f0dcd87e9c3"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-3-darwin-amd64.gz"
      sha256 "a2622edbf25caccbdb1a1104fbbd258c5901619bdfc3c7040aa9a82d10660a58"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-3-linux-arm64.gz"
      sha256 "8f8337c2d096efa21e8dd0b0f3402a4a148ab621038aa9012228227657984c8d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-3-linux-amd64.gz"
      sha256 "df29c11a741025dd2fd0d7e3d06d57fef44106273a932bec174f1fcf01721991"
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
