# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.109.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-109-0-darwin-arm64.gz"
      sha256 "392737bf177b7f62f4940d600d60c5211fa44a977908227e14f3e4c951646075"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-109-0-darwin-amd64.gz"
      sha256 "a1a42b94fdd2c03065c7f5e9051a3cb2adefaa5e299d3dcb6bd20ccebc9464f7"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-109-0-linux-arm64.gz"
      sha256 "8d98000aa0874269b0953ac40ee9902248bd9a77ad33393ba7584b1ec1b52416"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-109-0-linux-amd64.gz"
      sha256 "227ff5a4a32b8147b078e19c42552aa404a9f5b1d115f1277b615893359e3b4b"
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
