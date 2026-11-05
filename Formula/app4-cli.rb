# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.132.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-2-darwin-arm64.gz"
      sha256 "8e33224f2cf898e25133d21f917b5b61a5a972ee0f53b076b35721680ec87e99"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-2-darwin-amd64.gz"
      sha256 "28c9f7c33cd8d972bfb9f64f92faf309cfde6d25d84ef50bef2b881efd249238"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-2-linux-arm64.gz"
      sha256 "6a8bee89b73206f42ab7a35ac9d9a85681da40b79fae647511cad86850a50a01"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-2-linux-amd64.gz"
      sha256 "d0aed4d17c6b6abce24241aa96071d22686ad0f9051f4ebab73e99385f7637d5"
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
