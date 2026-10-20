# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.108.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-108-0-darwin-arm64.gz"
      sha256 "8fe1d3ba1ef4c3466549cb6a9cbd05414b9387deaa601cbe9d5434c220a3a819"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-108-0-darwin-amd64.gz"
      sha256 "efd3f4daa8011f1a10d5b00655bdf91fdd8e4acba3108e670f6294a2dd10a37c"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-108-0-linux-arm64.gz"
      sha256 "2adf61831ae06e8c02632a4c555508e0779cb071d3ff800a62986a27a6659d66"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-108-0-linux-amd64.gz"
      sha256 "e7b4abd5fa6d47df8314759e04e66f880b382d357be0d1c777099501c094d30f"
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
