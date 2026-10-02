# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.63.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-1-darwin-arm64.gz"
      sha256 "1486a94312ce0842d2d29551a4f2ca57e267ecba250dc1e9133af51d07859d6a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-1-darwin-amd64.gz"
      sha256 "1d4e58ec8afddccaaa09a38ade08c0760fb3c144f8e61d209d79b9059f846fc1"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-1-linux-arm64.gz"
      sha256 "76cefef6da82649431815601a2a877f0c5be076fb795fda395022803e36b4c48"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-1-linux-amd64.gz"
      sha256 "f706f29d7511335d45f52caf2a758c0fb5cd2821fe77adf1fdd3594d17783378"
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
