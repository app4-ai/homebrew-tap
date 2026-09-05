# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.28.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-5-darwin-arm64.gz"
      sha256 "1ad4eb56e8da6b95eaa559f59da9554d4ee97662ab6c6a6d7183290e39ac5cff"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-5-darwin-amd64.gz"
      sha256 "c27752b61021f4b1c35a4e811b28735e63580fd32bbab2f1b53b5d1f8c00fca1"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-5-linux-arm64.gz"
      sha256 "a19ab4eeaed9af71cf5b0bbe267f4e37605f74303d0cff587758a6fdc60e6111"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-5-linux-amd64.gz"
      sha256 "0540f28c6c59e4b8195b4f46eda611a08d56817506e5aa59043e57e6cd45717f"
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
