# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.27.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-27-0-darwin-arm64.gz"
      sha256 "724b49d5fe5c55210047d01a66dfa1b7fc0b6cfe8e487fd58bc8a5bd47937f45"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-27-0-darwin-amd64.gz"
      sha256 "7dbb464e962bf338ae93d9d229c0cb0c5c7dd7547c8d4747ae5f1bbf63ddc396"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-27-0-linux-arm64.gz"
      sha256 "715f45947688498e1de3358362a241656b75b09cf07c156f187d72da4642fecd"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-27-0-linux-amd64.gz"
      sha256 "98e155ba31226a247fc38e60c56feb2e35e119198690b9f33246af65cc5eb40e"
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
