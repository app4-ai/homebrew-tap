# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.129.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-129-0-darwin-arm64.gz"
      sha256 "8f403e6dd7c15a84842244bd8cace49412c349ec750d68b3e9a3f60c13ca1435"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-129-0-darwin-amd64.gz"
      sha256 "ab0e1c8b024d8d290164961fa25b5f6e188346c98f5febfc756e448217449737"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-129-0-linux-arm64.gz"
      sha256 "2c64912e40e4e58e5f4a17850568fe265307a3ecc3ff733539d7a2910bf6f2a4"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-129-0-linux-amd64.gz"
      sha256 "2be4170565ff5ad623561b2d036874c7637f1cca3987e58f7c889ed15f6ecc0d"
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
