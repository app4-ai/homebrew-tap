# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.58.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-0-darwin-arm64.gz"
      sha256 "e0ac5774d845c2a5216ac0864116cc33a35f1fba522681157ebbcaf5e91209a9"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-0-darwin-amd64.gz"
      sha256 "d72d101fc7e45ad964476c56c979df27e6e27f6624478bd4c6a07120940ce2b7"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-0-linux-arm64.gz"
      sha256 "4dbe229a32d1b289fb95422f87fe8675ce152f127591d7bd4270851fe3d94b51"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-0-linux-amd64.gz"
      sha256 "972dfdf4bff1b6cc4224e4a6167ab64c0ddd32f02d3c71e79fa485333aee7734"
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
