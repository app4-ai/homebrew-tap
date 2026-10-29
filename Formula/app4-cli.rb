# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.123.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-123-0-darwin-arm64.gz"
      sha256 "3237b8750794783b932f2e2c9d19eb002f9d6c6ab22706033e67f6ef1950239a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-123-0-darwin-amd64.gz"
      sha256 "770877fdcb897905014c5f315977f38af4eccf770183a3d5ffc2710eb5295d28"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-123-0-linux-arm64.gz"
      sha256 "f16ea723c38e14022114788500c6e921658f02c51fac53d906dc950af25a5950"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-123-0-linux-amd64.gz"
      sha256 "df9c9d09480c51c187f56d7b0e3873b9fe962b693e633e314fb3b13d7e0ab06d"
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
