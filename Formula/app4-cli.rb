# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.76.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-76-1-darwin-arm64.gz"
      sha256 "eba6d70cf56a96f0d1c81bc1dd975b9c77fe3b2ac7d644c938c8b8f360a83872"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-76-1-darwin-amd64.gz"
      sha256 "0210aef1eb6ebd33c1f9556a90a012098bf3f03719164f5015369ce50f0e63b5"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-76-1-linux-arm64.gz"
      sha256 "feb52d90eb4e26b34a220c540a1f723d8c9004ad4af804c5f58166315b07b276"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-76-1-linux-amd64.gz"
      sha256 "e7c6c246712c4264fa252c011e177ffbc5537efdf7d9c2229e4250a72758eefb"
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
