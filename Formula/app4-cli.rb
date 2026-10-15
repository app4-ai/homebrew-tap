# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.91.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-91-0-darwin-arm64.gz"
      sha256 "0355d274317a51c467c37da68984234188a2bc260887b7c0c8cfaae8dc16b019"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-91-0-darwin-amd64.gz"
      sha256 "cdd2738fba7bb1353f94a145fe8dbd8227e64a5aeba430948334a76128172ffc"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-91-0-linux-arm64.gz"
      sha256 "56eead08acc951d50f5dd17d11d0ea70fec9b3161f2bcc35ffde125d99f95e3b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-91-0-linux-amd64.gz"
      sha256 "5dbac7762b8b60daa40b6bb0c0b346e50a4e8d478b8129fa54458cd276d8337a"
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
