# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.32.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-3-darwin-arm64.gz"
      sha256 "c6ab4bdac45f313f7a72a311fb2b607d8bb7f6491e73ed3f38753a5148107f89"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-3-darwin-amd64.gz"
      sha256 "329bf89f34c2b78acba5f772b233c25bc32e5968711dc1db6c4ec3bcd144e38d"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-3-linux-arm64.gz"
      sha256 "7fe2e5d81269292f608c8c8a1c7d63e7cc09b9abadd5b98b4c1e508a939600ab"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-3-linux-amd64.gz"
      sha256 "ce80cee357c187a47b17a823de615bdfc89bab5919ba8d17facb12ec49f99197"
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
