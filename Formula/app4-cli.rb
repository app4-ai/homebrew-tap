# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.93.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-1-darwin-arm64.gz"
      sha256 "7362da6c8a30540f834f30d264c4b9ead710336ef612d6b986dec1c56f855428"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-1-darwin-amd64.gz"
      sha256 "7211c8196a68531331fef4e9c33d8fa793f0dddc17d3b31b94de3e5363b84ec6"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-1-linux-arm64.gz"
      sha256 "c9aeee6d66985933f0994bba0c947dabb5569da615a4519c1186b5bc3a75b079"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-93-1-linux-amd64.gz"
      sha256 "8329179050156c468f445980f9a0f2b429adaac0a618e1dc94b3e44461250340"
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
