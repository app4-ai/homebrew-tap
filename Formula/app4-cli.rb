# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.29.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-29-0-darwin-arm64.gz"
      sha256 "2945d6f2d86603cd2fcac3932ede79084f47d793ff9d340e75d10c72c4425052"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-29-0-darwin-amd64.gz"
      sha256 "d11319dc1712ad1b0cf4854866bded946532b5dddf15a3ab7324c8298a485962"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-29-0-linux-arm64.gz"
      sha256 "833efec36c89e841fdec2a3197d726715de8becd1aecd177009437fce86a41c0"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-29-0-linux-amd64.gz"
      sha256 "f0acc60ce2467899b1f8d600fb4ff854563211e0bd960085330c6c7d4d987f60"
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
