# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.69.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-69-0-darwin-arm64.gz"
      sha256 "9da184fd637f566f353299f286da0069d15d4eb2e173f670c78a64d946d9a691"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-69-0-darwin-amd64.gz"
      sha256 "7660f788fca8ec2d1f4b33b23e5e626573d8b8c49c483c0bc68c7afd9cbebd1f"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-69-0-linux-arm64.gz"
      sha256 "21c87fb252fd3f83301113f2c15f7c2977ddc7d83a39a30b2caa508603c608b1"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-69-0-linux-amd64.gz"
      sha256 "d354a14f15ddca83f2c61745ad36364d334ad6756293ca372c3bf89488f04f4a"
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
