# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.32.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-1-darwin-arm64.gz"
      sha256 "ab5190678c29fda69cb977bc1492b4c8d70bd90104a49c3e19e226a791623c53"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-1-darwin-amd64.gz"
      sha256 "c60b93c21ac328d949f38ca4a324639cd6cb838209499e683a80cb6b1f81a835"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-1-linux-arm64.gz"
      sha256 "4639c17235214a86365141decfb0c9209d567de7c4e0d1476e697d4e8b3208e9"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-1-linux-amd64.gz"
      sha256 "1f0cbbaa2f28119ed378b9e3a81a39c380c11819c22bd24c551f08d83e104571"
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
