# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.100.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-100-0-darwin-arm64.gz"
      sha256 "2ab6e28d290f278c1882ff3f6b0d5de433ad43f9d293a2c995d0dc91c8774267"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-100-0-darwin-amd64.gz"
      sha256 "a3ea360e7d16294461128bff1c889777a402921f44cbdb3cb508b1e4e1c3f397"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-100-0-linux-arm64.gz"
      sha256 "27717d7e89e19f71d9d44fdf71bd5d20c525dc32156e8ed0081ae54cee7f9912"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-100-0-linux-amd64.gz"
      sha256 "203a42f515c75037f00e34076006e747c24b41bd67dafb481da2c4f6509a179d"
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
