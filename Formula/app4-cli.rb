# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.63.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-4-darwin-arm64.gz"
      sha256 "6de5e87d0772bea0415ad27cc9b896d7a822f1761e268e130b399b3d5c0fa43e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-4-darwin-amd64.gz"
      sha256 "56533424f02e23a739925480e6d8d7b8b081e4707a85db767c0d30afe65d67e2"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-4-linux-arm64.gz"
      sha256 "6c050ec99330c3a0c38612901d7fc27786d2308a00816c890812f5e8e8ad6ab0"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-4-linux-amd64.gz"
      sha256 "64be0f6445de6c49bb139d3203efae7c4960f34926991d1d89935ff33929da03"
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
