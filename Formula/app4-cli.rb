# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.152.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-152-1-darwin-arm64.gz"
      sha256 "1d3bf3820221b2eb4487adf72f1aa938e89aa75859c9a808ba5bc2008be8ba07"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-152-1-darwin-amd64.gz"
      sha256 "fa93ba83a377c234d7b5dfe26ceeb7c54c4894b5d654f5e464f7deba9e881007"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-152-1-linux-arm64.gz"
      sha256 "aa65c4abae82571ea101d3380865709466722f3bc7fe9d013a4b345043987635"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-152-1-linux-amd64.gz"
      sha256 "a9f0821c4628e3d55582d7f57141defad61f5fbcd8d517a2308ca2530b5ae8b7"
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
