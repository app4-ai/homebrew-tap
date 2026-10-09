# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.81.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-81-0-darwin-arm64.gz"
      sha256 "11f7fe1102e3dc3b573bacc2ac1596db07f5190d8168d02f731860291191b189"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-81-0-darwin-amd64.gz"
      sha256 "0287fbfdcbfe9e6ec34158ec6690eadbfe7eb7799a5d9ae7b41f36c245133dcd"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-81-0-linux-arm64.gz"
      sha256 "f7c6c1b5948d7a82bccc741b353a96091ddfebb3ead4936b87905aa854a71b75"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-81-0-linux-amd64.gz"
      sha256 "39b672fd2cf4d4fdcc53225ea63d7ceddf470efa1b6cac3ff7d1489cd3c9fd67"
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
