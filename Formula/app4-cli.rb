# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.62.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-62-0-darwin-arm64.gz"
      sha256 "1bca1333c206e76cf96a5a62d6aa1b69dd564d26c75cdb8ef48af00a5a2af970"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-62-0-darwin-amd64.gz"
      sha256 "01d67ebcaecdcc9607ae1704210cdf3e79957266e1c3978ab16a81ba07d570bb"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-62-0-linux-arm64.gz"
      sha256 "eedd6beb0caae1caf48ebc0be2abd3d3498d9998eefb455c9b5cee4a35d71212"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-62-0-linux-amd64.gz"
      sha256 "5f4d583d538faa71ba8e6430f63c6aba810f8446f5fde34c42d33c4f523d64a3"
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
