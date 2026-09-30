# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.57.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-57-1-darwin-arm64.gz"
      sha256 "21d20b27dc805058db5ba41d77dec2bedea14f31cec7acb9bdd83230c3be01e5"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-57-1-darwin-amd64.gz"
      sha256 "101b59699d09e703f623dbd7dd985fe46fddf1cb48ccd270c33789428c69c5a4"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-57-1-linux-arm64.gz"
      sha256 "eacde260fca6f4731053c0ad0e62485cd5d5602a59567d8ce76415abb9eea2ca"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-57-1-linux-amd64.gz"
      sha256 "363223994da2f9c2217e44248feb654cc3059a8619cba80465bc29c1bf62a233"
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
