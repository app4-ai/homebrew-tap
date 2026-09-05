# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.28.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-7-darwin-arm64.gz"
      sha256 "b02419c2c37f5403e332cc8c0dce75542e3a7e836bd6f55a34b1bbc25d936169"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-7-darwin-amd64.gz"
      sha256 "a06c403d7bb01f967f67cb6c49e7ef4112dced7935c87540ce3620e1e0fc69f1"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-7-linux-arm64.gz"
      sha256 "fac7b740b6890a7b9a2f82217bd497bc6c3c784e05ebb6927ea25a605a1cb4db"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-7-linux-amd64.gz"
      sha256 "ee579417c76781246bf7f4ba39f13dee0b1f54b448782496996f483e28825093"
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
