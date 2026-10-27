# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.118.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-118-0-darwin-arm64.gz"
      sha256 "e1fecbad3d39407ba6a9f4491c52a82cd32679bb787d629f3ea868d600ddccc1"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-118-0-darwin-amd64.gz"
      sha256 "1d15de5bf042601e338def10465a996b09544b0b3b5d54d0715e41b40b5e9914"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-118-0-linux-arm64.gz"
      sha256 "d1229373cdaf9066231da7ba8d709b90b95712bd0c4717026a2c36bec5703a0d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-118-0-linux-amd64.gz"
      sha256 "ae302a05bfe42c76a9db4b0f52550065c6e7217ccd576def4b2abac96cb8fdca"
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
