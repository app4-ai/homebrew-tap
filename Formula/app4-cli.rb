# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.65.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-65-0-darwin-arm64.gz"
      sha256 "cb46f192c672b2e162a8f0aa3ab164587f0f1dce61d635b69a0b1e32a64c7c13"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-65-0-darwin-amd64.gz"
      sha256 "cb86016d6d91351f79527d6c14ffb0aa62674662a24aab80995b95dac44c3f84"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-65-0-linux-arm64.gz"
      sha256 "f0018059e542c800185b4fe9c895f622995264b51c14da5ed4b17a5cac547431"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-65-0-linux-amd64.gz"
      sha256 "f4c586e3d120ab009320110a0a0c735d9dbb5518f190317b40bac281cd2c5726"
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
