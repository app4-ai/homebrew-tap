# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.38.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-38-0-darwin-arm64.gz"
      sha256 "4ffe174a46837a470f8482e2e2e04afecf25e89bb16c2e819bd220bcfb699c41"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-38-0-darwin-amd64.gz"
      sha256 "bc8d8dd8a44b4acc263f40fc4598ff95d607852e980420bd7542c44c1a957cec"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-38-0-linux-arm64.gz"
      sha256 "139d77670ca8e2fd91170a6c74666ca1164b7de9e6b023f41c92851ac026b94e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-38-0-linux-amd64.gz"
      sha256 "012c53d91c7460e2d16256f91612a73364c5573c4978180a02b5fc04bd7823aa"
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
