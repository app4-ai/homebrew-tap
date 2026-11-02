# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.130.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-130-0-darwin-arm64.gz"
      sha256 "c72ceb3110bf9b62c34e3a2d798445b24c4fb1f4b6baf525c0e84b3f82aa9fc4"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-130-0-darwin-amd64.gz"
      sha256 "e26fad182220582b07b30d07bbcd1cc59555f5a8d3d64d357c9c81cc87afc27d"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-130-0-linux-arm64.gz"
      sha256 "4050ae50e5720e777f5013bd38f3ac96b9347b927f07f5ba9d2eeabc23a11c37"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-130-0-linux-amd64.gz"
      sha256 "124af0be92450560f8e3c510b4735bc629413d4678366ba389402bd611241e33"
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
