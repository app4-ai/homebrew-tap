# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.58.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-2-darwin-arm64.gz"
      sha256 "969fdc7e3923155bf9d9c7545dc23587eba051dfb8e06a734ba7a50a2302bd7b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-2-darwin-amd64.gz"
      sha256 "bad5faa247f40c5093580bb9c2d3912007f075fe76a9ab4d8cb27bfec0a23e28"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-2-linux-arm64.gz"
      sha256 "60b17d847b41adbbc387ba210d11a0ade874b9f4ab13efaefd4ffe075f53a6ec"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-2-linux-amd64.gz"
      sha256 "13a6f51659d033d0d8284d85aadc69fed1b165e5d759ee16545d42a83a3076bf"
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
