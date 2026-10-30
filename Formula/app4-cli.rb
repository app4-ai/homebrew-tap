# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.126.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-126-0-darwin-arm64.gz"
      sha256 "88c3884f874fd2d6fc8ad4d9223285be459f564331c7704c94c7ea1da003abda"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-126-0-darwin-amd64.gz"
      sha256 "72bcecda7cad32e2c164a50a08d17bb599afe2a9ba33bb6aa03d75d82772e05a"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-126-0-linux-arm64.gz"
      sha256 "35b1a727cb292c967d9c17dfa959575b8610dddadc05639a948dc9a5fcf1e4e4"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-126-0-linux-amd64.gz"
      sha256 "7971a4300de857f5f850b953117b432283bc5e9be823eee2d5054967035870ef"
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
