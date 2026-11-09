# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.132.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-6-darwin-arm64.gz"
      sha256 "71636a18e529730fc8a3a99cb37287e3e234c8c332500a9e96cda8c01b5093ce"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-6-darwin-amd64.gz"
      sha256 "fff86d1803c7568881a796ac6bdbca95d2cae695e5e9acce7e1251947470bf5b"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-6-linux-arm64.gz"
      sha256 "46e15a33e05e840d7659864e7eff14881fd892d0e4b924f2a135403ddc88429b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-6-linux-amd64.gz"
      sha256 "40e70fa3aca7f285718ff3851eef83c66e455e28d0337ef8dc97bc606c34e43b"
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
