# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.147.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-147-0-darwin-arm64.gz"
      sha256 "984a3d21e7f6e33dbc2a53f22efef8829e4b7df8ae96b01bc6220383b6ed0523"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-147-0-darwin-amd64.gz"
      sha256 "70bddc227d30bbebb687bc17521fc72b495c98d1a2e9a9e170cf44189d8d7e34"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-147-0-linux-arm64.gz"
      sha256 "a044da7ac80fd552cf764a9d05aef0fa6fb06ed7775de6a6e5b69056ee0f4ff9"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-147-0-linux-amd64.gz"
      sha256 "72cd5dffdcc6a022df8539f22c08fac036a384e9d82dde8ec4884cff7501d90e"
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
