# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.125.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-125-0-darwin-arm64.gz"
      sha256 "2c158b8ac571d6a79dca2ce2ee2897fadf7d6287f36fa3055bd23f8e016493e4"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-125-0-darwin-amd64.gz"
      sha256 "9cb97e5cf2ced695166e62e3e80997462b5a9e099ebe84e511cd764339ea54c1"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-125-0-linux-arm64.gz"
      sha256 "a6ec222865ac40ffee2061703564e782b8e9ddb74c98bdb069d72a9b4fe5e95c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-125-0-linux-amd64.gz"
      sha256 "f3ce85bd52ddd23a3665c20cdff37228bbe889fd886fe60398704a697e30e00d"
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
