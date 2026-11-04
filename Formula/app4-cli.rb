# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.131.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-7-darwin-arm64.gz"
      sha256 "b1c1064205baa67cd8952757f2ffb23da52d2cd604e14a86f8fab5511e120726"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-7-darwin-amd64.gz"
      sha256 "a0b822ef02149985169b66e965a7c36791723df60ef290466fbaf5235e3dc5a9"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-7-linux-arm64.gz"
      sha256 "5dc691b0c4c1fea81da220b3cfe70339ad5f2bab4acd63de89094b2417ef4a9a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-7-linux-amd64.gz"
      sha256 "4223ceb1e464c51f24135252ffbb91c8978b276839a373766283f72c66d6a6d3"
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
