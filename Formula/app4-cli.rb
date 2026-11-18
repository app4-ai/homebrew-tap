# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.139.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-139-1-darwin-arm64.gz"
      sha256 "73061718dcedf4fef7d0b86e8e6e620b3320c0f97d95e5d1fa6d0e89b900797f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-139-1-darwin-amd64.gz"
      sha256 "48536c064e4b09bdbb79102c2f9fd5cdc09647bed9e1e883ac4091ecd88dcd0f"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-139-1-linux-arm64.gz"
      sha256 "54087639e558f1dc58fcdc03a8096b8b66817f59e305be4aee250328f5f614ca"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-139-1-linux-amd64.gz"
      sha256 "789351631135abaaf06b6486c62e9cec7ba860b44e170c9fc61640263804f5ef"
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
