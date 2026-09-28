# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.46.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-46-0-darwin-arm64.gz"
      sha256 "9ed747e65a18456ab02d50d2f56e84d4c77169e1a9267fc92afc06822344cf2e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-46-0-darwin-amd64.gz"
      sha256 "758f0af311b319020d0ca1e95a4b02957a4b00b2ad7ad46de9ae5d8b9958fe38"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-46-0-linux-arm64.gz"
      sha256 "31eed12ff9bbbb23c3a39a33d25c79581996cb4a828055e70ba3a807d6b0cd65"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-46-0-linux-amd64.gz"
      sha256 "88a1a2f56e10f1c37b7a95eae8651dbf4432a2ad62a1d46b924a744394f2c5e7"
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
