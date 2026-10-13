# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.86.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-0-darwin-arm64.gz"
      sha256 "4d19c113c655b7ac102e8bb5b3ef603f48cd9c62b56b59afa1b8294fd82abf45"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-0-darwin-amd64.gz"
      sha256 "b543d0eccb3671f1fe89931e4d109d500c23f54b0384ad0e161e234460cf3995"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-0-linux-arm64.gz"
      sha256 "67443a113d7a54d8ba84b7470a9b17ea4831857b82582906deba65de410b2210"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-0-linux-amd64.gz"
      sha256 "9ad6c33978918f396ce73822c82ef7b78ce9e66325de4cd150368735aaaf2c43"
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
