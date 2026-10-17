# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.98.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-98-0-darwin-arm64.gz"
      sha256 "264c1a2134461a331f43fd40536694b7c3eb6e891b59862ea810f0664c7c9adb"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-98-0-darwin-amd64.gz"
      sha256 "35309133cfb0f0d47355c4cbcfcdab429b122bdb0076d33fc2d6f8cf6e164b06"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-98-0-linux-arm64.gz"
      sha256 "6b2cbf2dcb3beae26622079a6276865aa8883190dff277a7f66731e40b225632"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-98-0-linux-amd64.gz"
      sha256 "ac5eb624271829005ed8e990611723f099018fb936bfe1a10ccc0c490fbc5983"
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
