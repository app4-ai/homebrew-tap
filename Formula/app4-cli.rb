# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.112.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-112-1-darwin-arm64.gz"
      sha256 "2543593033aafc33ee6ff35729ec071de9467801bff0566928d1b179454b6769"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-112-1-darwin-amd64.gz"
      sha256 "bb8803bbd97c31a42ab92bba2f4e33399fb629fd1f587d726d27adaa1f13b688"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-112-1-linux-arm64.gz"
      sha256 "958ef244b7729f39e871b856619e074388b0c91059fca030e40fa4e9d132e5ab"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-112-1-linux-amd64.gz"
      sha256 "9f5c156e35759160df0f66dc99a2ad5b413ccceb12837ce3ce903803a6fb19a0"
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
