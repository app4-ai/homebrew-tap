# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.84.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-84-0-darwin-arm64.gz"
      sha256 "e7653c4dc5e1eda37ba4a17729886c1435beba368c414acab35d2261f776dccd"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-84-0-darwin-amd64.gz"
      sha256 "6a4b582ffcbcf656c1d6faee0903f433c95a054ae71681ba9ad7ffb21fe72311"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-84-0-linux-arm64.gz"
      sha256 "a84f28e7c41bad7bf08631b375ccc50f48bf97bc1b4c3d9072b1a9995aa20a8c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-84-0-linux-amd64.gz"
      sha256 "e26885c6c4d147d88c43681e6c9b5f7d171eb0f482bfd25e870741bfc63b6c00"
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
