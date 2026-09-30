# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.53.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-53-1-darwin-arm64.gz"
      sha256 "59cdc5d05809dbd4643b17526828ec6c1a6a67efb7f3d0c23884bcf4dfc27557"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-53-1-darwin-amd64.gz"
      sha256 "a59943ea733481259799cc12976397d93c2b3afe1a4e2809fc79b547378d95f2"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-53-1-linux-arm64.gz"
      sha256 "e4828161d38d22f57504c77f0f70362c4905c08b7de28b6f690263f5ce878da3"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-53-1-linux-amd64.gz"
      sha256 "681579c994a2bb7e03ca351ad505cb3eec41e533800bea974bcced3e5984eee0"
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
