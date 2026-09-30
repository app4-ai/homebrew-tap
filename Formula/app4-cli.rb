# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.54.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-54-0-darwin-arm64.gz"
      sha256 "61588218eb4affa8bfb2eca3e6dbdde7d3d16fa7009d788363d390477e528280"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-54-0-darwin-amd64.gz"
      sha256 "66dda9585c0f1a5b0ba46fb7bc073a384db4521c3ecff7f9bf6416d25429916c"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-54-0-linux-arm64.gz"
      sha256 "2748af10dc8b946d68b14d6833d311ec4603a74018d46dbe86ce1682d717de78"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-54-0-linux-amd64.gz"
      sha256 "6436be616ebbc1ecd1a88f60cad18c0a29b781ec387cba40750695e0f8a44b32"
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
