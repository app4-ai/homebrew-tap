# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.103.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-103-0-darwin-arm64.gz"
      sha256 "866a0e35b28b447a4a79f7495b93519331c243eb5c0efe96aeb7cc3d4e6b8b22"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-103-0-darwin-amd64.gz"
      sha256 "b1bab4deb0f82c36ee0c487bda4d0d8504e1de3f2c1929d5909018bf44479672"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-103-0-linux-arm64.gz"
      sha256 "9106f7a414581b36df70fb1c2f5ee7b3b532f9d0c220aba522535498356b2d81"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-103-0-linux-amd64.gz"
      sha256 "bf7f017fe3adeeb6a94436eb6b7e00f14f2daf230ed8371b51e1c15b29a2af8f"
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
