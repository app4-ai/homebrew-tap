# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.72.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-72-1-darwin-arm64.gz"
      sha256 "123f66620ef33497f658caf8cef1985573a0bc32287a68481def9624f0219900"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-72-1-darwin-amd64.gz"
      sha256 "71c5dc7cb0fa8d8a8b5e0b95b9d5c3bfec4a931a85624901e129655e6a2caf5e"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-72-1-linux-arm64.gz"
      sha256 "e887cb9196421a6c1864bf886d82e38b0bf415b242ff669516ba908705720ed1"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-72-1-linux-amd64.gz"
      sha256 "d55a2e352bb04c4c94f2effabf058fe56309f443723d915139f2701b25fd060d"
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
