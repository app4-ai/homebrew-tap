# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.72.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-72-0-darwin-arm64.gz"
      sha256 "148e82cd7370b2b9972ae98a87e184aec4c8014891fd93e46ab3ea70151d876e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-72-0-darwin-amd64.gz"
      sha256 "990cb506d4d9212b88e21d345811c51b2022ddfc40fc663456f260b9a7b74e21"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-72-0-linux-arm64.gz"
      sha256 "f7e99e7174dacba1fda8230786b5e4f79423b9dae26864fed312f1544480573e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-72-0-linux-amd64.gz"
      sha256 "7751d435b9a0303ede58f65b907140c54316bca5e23bbbb7e3f27ea79c7d576e"
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
