# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.31.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-31-0-darwin-arm64.gz"
      sha256 "28e49d3ed28a1b6c00f615fbfe944ac2ce87e48f6c4f3249f5064747c8a88643"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-31-0-darwin-amd64.gz"
      sha256 "5c0bd54fd5daf30702ee9489ba114f7106701d37657d7d88cdd7b06abfc72ced"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-31-0-linux-arm64.gz"
      sha256 "90ecb7574c3263780ddc42c9111fad55480e5a83744a3e881c5d357787d13b88"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-31-0-linux-amd64.gz"
      sha256 "0898c8cfc42e9ed12457bbd4af4d6eaa4d43b47bf280a61403591afbc918a3e6"
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
