# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.45.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-45-0-darwin-arm64.gz"
      sha256 "a94ea9d5afd26b92b43e54906633064dad410a160d8dec7ae153f65636c42928"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-45-0-darwin-amd64.gz"
      sha256 "2493a39d8c6df597cd542958b4d98269eca7dd0df68bce1aa27d0d3d8e837ea3"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-45-0-linux-arm64.gz"
      sha256 "9870a2b6ae6ae72f503d53612e411ae39595bc71ac4800c4a1c9e0a1ea7dcde2"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-45-0-linux-amd64.gz"
      sha256 "cd6a5f0909638e5abc308ce67d5707db797c2b933eb916174463373016291aee"
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
