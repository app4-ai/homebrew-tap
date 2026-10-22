# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.110.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-110-1-darwin-arm64.gz"
      sha256 "8ab30b921837fa5bac09b220e69fe6e7306d69b7157948df995e654ac66f3c68"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-110-1-darwin-amd64.gz"
      sha256 "59938817bcea2baf4a8188e7648c4a21f97a7d56e1ca87a2edf9d77e24957dd8"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-110-1-linux-arm64.gz"
      sha256 "bd449a7b91eee50d67941d45c0fc6ccf58d3ca11652fd3d7d0d4119db1e365db"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-110-1-linux-amd64.gz"
      sha256 "fee332318e641ab37d5dd3e5c0c0bc0647b1de8017e1cc03dd6f3d35cf0475e5"
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
