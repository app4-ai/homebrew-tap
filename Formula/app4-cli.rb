# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.132.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-8-darwin-arm64.gz"
      sha256 "a1e35a9b7fc88d52b5df51e050f7787252b200c9b2acef6c0833e8ca92a8168c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-8-darwin-amd64.gz"
      sha256 "06e9538d130036c8a93dad7953b2b1e9696f3329b5d4adce3ec84e155bef2e68"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-8-linux-arm64.gz"
      sha256 "b753e587c764a620c177530e454d6f42b1facef1bd4c7994f561660ca776079f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-8-linux-amd64.gz"
      sha256 "97fe5989aa14a1cbf76c3916ea617c05780cbdbb63a033ae1c954e2f178d52c6"
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
