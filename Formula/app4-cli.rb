# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.143.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-143-0-darwin-arm64.gz"
      sha256 "cd777d085479aca3b473e47da03ffd9e5532d4d979b9e7bb4951c2bb3a6ea42a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-143-0-darwin-amd64.gz"
      sha256 "cc5a2c0b255f959f72bba6955fde3596b3c1de2f459bd7185793a637e1bc469b"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-143-0-linux-arm64.gz"
      sha256 "fa214762f09175e99b2ee668c1a86f963eb9fe060f8be4235bbb967d46e96681"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-143-0-linux-amd64.gz"
      sha256 "e2a8e39ce89ed91bfbe3fbaa69e2268bcf0972a844b82a2cfc3034b38a1e0289"
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
