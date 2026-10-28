# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.122.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-122-0-darwin-arm64.gz"
      sha256 "7a5af752179325d46b78f1ea10438feb24c6bfbf18ec84281f08c62f64f9427d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-122-0-darwin-amd64.gz"
      sha256 "0cb1ac4d8e220cc212d9f2c999a1f208287ed380626511ee389d87165e42fd43"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-122-0-linux-arm64.gz"
      sha256 "ec7ee6497bed39c9f99ef97b31707e7cf44531d39ea2cfa1b1dfb3be048a73dc"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-122-0-linux-amd64.gz"
      sha256 "4496fa7ddf5d803f9fa4a019d646e8a1df4dd89497d045cdca2789e16f6b3e54"
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
