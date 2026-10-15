# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.94.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-94-0-darwin-arm64.gz"
      sha256 "a8ef8506b0c4f08d104783605bd544809e5cb73568d87ae0a856bad9b17e487e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-94-0-darwin-amd64.gz"
      sha256 "6cf99df7bd831b0103bd281e7aa328227d16dcd119fbf4ceb8b30f0869901b6c"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-94-0-linux-arm64.gz"
      sha256 "3b4b277e8f6ff9c36e5ce5912de9be522e5acd76a88b50c5b284b23d164f71b6"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-94-0-linux-amd64.gz"
      sha256 "65105bc6b3f78645f4e7c59838fa7336e9267ba091efe094f340753fd80e3f68"
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
