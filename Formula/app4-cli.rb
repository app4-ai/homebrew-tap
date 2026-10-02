# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.63.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-0-darwin-arm64.gz"
      sha256 "b44f79b4e522501ca12f04abad4fe2d0c7d2e734ec580755e4946c0e310d738d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-0-darwin-amd64.gz"
      sha256 "ed23f72c3315a37e3b4d3038add62eca81d1c474b39d1fa84145c86a01b0e08d"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-0-linux-arm64.gz"
      sha256 "8579ba95e8017cde133d8611fe90d8e718ea80a79ea104bbb18eae24299066a1"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-0-linux-amd64.gz"
      sha256 "e23a95ae29e896f63a58b508d2db8c4aa620041ca4e496b2e6a0c7647d67a909"
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
