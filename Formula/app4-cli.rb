# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.93.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-0-darwin-arm64.gz"
      sha256 "373e8fbfe861a82e8845a4adac9def2e50c6d25724eb858c4b389e1f513b76f9"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-0-darwin-amd64.gz"
      sha256 "7f690b548cf90dad5ff2e06138fb4334d4476da40c8446141912ab82c33fc1e3"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-0-linux-arm64.gz"
      sha256 "e4b4f31b8f72890146314934e95963f96557b756f638e64b6cbb0b16de19e436"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-0-linux-amd64.gz"
      sha256 "7590483001deb0fbbaf72c28c72a95ad85446b474ffc22309000ad77311e4271"
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
