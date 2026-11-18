# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.139.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-139-0-darwin-arm64.gz"
      sha256 "3ddf1bf71b1cf36bb42d48332d292f7fc4db0616b298d904c54aaa88b709febd"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-139-0-darwin-amd64.gz"
      sha256 "39fb4e81d6a240a35c7e2554953af2015cd75c17c11ca7a537e6575b83c7dcc4"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-139-0-linux-arm64.gz"
      sha256 "3b26b4f0b0247e32d0076c380d463e3e2151fc9fde6ded24c4b1768cef4de3f6"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-139-0-linux-amd64.gz"
      sha256 "fde7cdcedcb5d4340f15e7fdb9ab1d1ce15e47e47c599a9e00de7f1a7ca61018"
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
