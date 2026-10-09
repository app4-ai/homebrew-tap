# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.80.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-80-0-darwin-arm64.gz"
      sha256 "b15fe93b536653edc4a46ea99e83eba40e312454b8ce40d10d6b67e1deb332d3"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-80-0-darwin-amd64.gz"
      sha256 "861761ed6ab9aa853ce97acd96f2c32be62f93a9cacebdeae37d8551be56a8b5"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-80-0-linux-arm64.gz"
      sha256 "6b85a9049a6d477ba2849dbccc5ef3f8d2ec7b847aba1f998eea5c9710545e54"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-80-0-linux-amd64.gz"
      sha256 "a9d19e5e4cc2c51c12bb97348c4477595dc7dbc5f1365f6160c687c2dfaf95b7"
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
