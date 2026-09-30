# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.56.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-56-0-darwin-arm64.gz"
      sha256 "15ede69e8b4677a8a6e35760cecf9d22e43662ab8f8ca1228fd89ad77344e2ef"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-56-0-darwin-amd64.gz"
      sha256 "1a7d7bec32cbeb42a8aa2a9e292509b7be4e1638da6defc895931019ad9a3350"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-56-0-linux-arm64.gz"
      sha256 "39d29b055871948d910cffbe437ec5e5bafe0a1f7b77a64bf8fe9e9298610131"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-56-0-linux-amd64.gz"
      sha256 "d72ef4799846499f2c7f2e4b76fa7df0d865223c2d59d9fc99857b0c07f79027"
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
