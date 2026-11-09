# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.132.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-7-darwin-arm64.gz"
      sha256 "58f829da45c44cf15fccf14b6e35ad33fe97fe66407cfe8e17de543a48a84e86"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-7-darwin-amd64.gz"
      sha256 "32721df6cd5ad2f55fe1ac91baad077a69b9052bda01fb4d03864a7a6d0822c2"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-7-linux-arm64.gz"
      sha256 "c81347fe1f82a30546fd1aa591f2c24b350d4053b4b771b295d1fdc51fadeb89"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-7-linux-amd64.gz"
      sha256 "62f4dddfdba64a6b12977b3a992b46cc3063dd5f4eb1f6a63caa54cef990733b"
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
