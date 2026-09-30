# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.57.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-57-0-darwin-arm64.gz"
      sha256 "2208a007727e69ad4fe2d811b32fa6d032c3a5d5e0f3031c067a8d2c3bea9273"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-57-0-darwin-amd64.gz"
      sha256 "055ce686de9db6cc9769239dfb32f6a120a9e6d76149658e694ebf31a190d1df"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-57-0-linux-arm64.gz"
      sha256 "5c7ac313e8af60dd8bf363c58ee6eb4ac11a528477b17e59f6e121cf39098caa"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-57-0-linux-amd64.gz"
      sha256 "2bffd15b6238b403eed37c5aa129c024fd9b1107bd15ffc7cbfcf92ff0ad20ee"
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
