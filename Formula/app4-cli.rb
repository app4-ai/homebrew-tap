# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.79.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-79-0-darwin-arm64.gz"
      sha256 "f0a56752a53e72b8636fdfa38f01f7303bf8094a14f55018d018d0a7a30ccafe"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-79-0-darwin-amd64.gz"
      sha256 "8987c76ac2f9dc66145739d543c4a22dba78b81aeaf4ec73a15f3f1f5259d08c"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-79-0-linux-arm64.gz"
      sha256 "31330dbb74cf28ae8592f311e73db168b24b4adfa543bf17e9f97862659a7153"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-79-0-linux-amd64.gz"
      sha256 "2540b864055d7690a4bd910594c5e3baeba5f26e3ea37c220620824b5e4970e2"
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
