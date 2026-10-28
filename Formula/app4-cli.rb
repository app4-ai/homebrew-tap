# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.122.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-122-1-darwin-arm64.gz"
      sha256 "a10f17838063808d559662699a4d9aee2d78d49c553ab19e27ad2873b27a275d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-122-1-darwin-amd64.gz"
      sha256 "30ae4e00054e9beea34325b703b6182ed18e0cc2fd3490db43ea4d6c4f530faf"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-122-1-linux-arm64.gz"
      sha256 "e626ecb9d54d7baf864f80a61905c850d7789bf67cbe80e02a3b647e88578c35"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-122-1-linux-amd64.gz"
      sha256 "e95d320d1f349bc3b083a0300d9e7b7c272cc7244e5345e5f5a4f9acb33624ba"
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
