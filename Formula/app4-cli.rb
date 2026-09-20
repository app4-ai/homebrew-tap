# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.36.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-2-darwin-arm64.gz"
      sha256 "7d7a2f8a56c85c2676d693231d37a5d59bc67aa72806ab1c657669b9102614be"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-2-darwin-amd64.gz"
      sha256 "77907d3b4f64f43a9d1be0d8d3f42b863e2b81c310505211a24841df2da33312"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-2-linux-arm64.gz"
      sha256 "6c8211a00649e93ace7a66ee1bb85564c9eda5ed8ea6e5386391804594e9375b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-36-2-linux-amd64.gz"
      sha256 "62f15251bcddf0d9c2d4d306d1013fe67389fa86e84e9d0617a918a9bed059fe"
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
