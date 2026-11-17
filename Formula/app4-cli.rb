# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.138.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-138-0-darwin-arm64.gz"
      sha256 "5622a83d19a636c7c666364274aa2cb64cc09ef14ecd0773e89a512746dce7c7"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-138-0-darwin-amd64.gz"
      sha256 "9cafae7bcff57b06b420b46b4ddfd0bae46758ae6c6d7743b1aa15d0dade9ceb"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-138-0-linux-arm64.gz"
      sha256 "eb88120a0ba8a32d04025ecdaafbeed716aacb8e34af5e27478354cc3abf2f28"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-138-0-linux-amd64.gz"
      sha256 "eefe60f5e2e2687f034ee0216fd6251d4c64042e676e65a9a2f3e536ef3bde9c"
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
