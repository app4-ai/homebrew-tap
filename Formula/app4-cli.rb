# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.64.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-0-darwin-arm64.gz"
      sha256 "dec1bfa50f65185f9d9be1399d7e0b8b01dd9a1f1867a809a0e1a16d8e712eff"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-0-darwin-amd64.gz"
      sha256 "c1e0b966f9c7f80650bd4ec0a019a12e5150071927fad8b2250a0dffc1adeadf"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-0-linux-arm64.gz"
      sha256 "7e3a771ed5fa71d9546d57c794268a268fc3a9929f13d2ceb889472105d99255"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-0-linux-amd64.gz"
      sha256 "9764c2f96acc9cdc05839812bf695d2b97f08ee60c3bd3bca0510d2f7d002689"
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
