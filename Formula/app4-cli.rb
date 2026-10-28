# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.119.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-119-0-darwin-arm64.gz"
      sha256 "2e7f32b551f920fa90817f68617afdc9ad94f283b66ca4331336727efccde0d2"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-119-0-darwin-amd64.gz"
      sha256 "f30894ad9cfea8902831107de80d4ceb7368080ead1b52cc05a3669b68f304f3"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-119-0-linux-arm64.gz"
      sha256 "edb104703dbdb83d81b66994fada5a1fad3af0ac0f1bcd6c8751f62dcf43041c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-119-0-linux-amd64.gz"
      sha256 "6cf0e392699225b57e4dcefa94f6f97764cbef114b2e186f9b79c1308ed12000"
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
