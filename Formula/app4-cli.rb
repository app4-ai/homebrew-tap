# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.92.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-92-0-darwin-arm64.gz"
      sha256 "2ab239b3f17b8f438230edf9f409bc2778e0758ec9caaee5236f5a859900b96d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-92-0-darwin-amd64.gz"
      sha256 "a78efbb8f580b78ce6cc35fd241f239a28ffbfb307e7af61e83a5edcc611c28c"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-92-0-linux-arm64.gz"
      sha256 "4109a54c3b42ed8f1afb5050fa0774a6706bde981e4115f8cdab4d3797db27c2"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-92-0-linux-amd64.gz"
      sha256 "bf4c0a4ec21614269c2b800b5ddbaabe301d444bac9467150a372dfbc480e315"
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
