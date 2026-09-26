# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.40.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-40-0-darwin-arm64.gz"
      sha256 "65d06d96efb1fe2f513a941b81392d6b669a138a0108dd6ff018dedc384acb10"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-40-0-darwin-amd64.gz"
      sha256 "715ff5bf2e2be1c6b471f63bbd89401c7e17858045a397901c21f121434a2ec6"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-40-0-linux-arm64.gz"
      sha256 "dac1477022eb5687da4767dcaf474b74aba33547bcac9e913a56f8b2c4fa93e3"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-40-0-linux-amd64.gz"
      sha256 "a9b519036f777cf6846f6ee9d53c511bf5538bbc248f6f5658a47ae6cbe6dd06"
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
