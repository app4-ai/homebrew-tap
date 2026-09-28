# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.48.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-48-0-darwin-arm64.gz"
      sha256 "1b1edec5e81c641aa206d8d39271b8cb968e600e935502e6be2f07236bc7695d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-48-0-darwin-amd64.gz"
      sha256 "1598dfecaee4359e54e337ffad91e7316ef66091d36258115ce52fb945243096"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-48-0-linux-arm64.gz"
      sha256 "9cba81c9dd8f75db108d564e7d071342411ef1e78424939d7c7ea997b3ea9258"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-48-0-linux-amd64.gz"
      sha256 "ddd6675b33c013c9757158801a9dc8afe35df8ee324fc9d1a7934bd458c843b5"
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
