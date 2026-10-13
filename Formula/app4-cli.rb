# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.86.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-2-darwin-arm64.gz"
      sha256 "db44d97f439016e7df779e925ef189df8b57042927fab2e0a3ffda7cbfdd6951"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-2-darwin-amd64.gz"
      sha256 "508d2a2c6ac943a1a0fab40bd7bcf7da66ce6c0748232a7e248e9fc89521bf9c"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-2-linux-arm64.gz"
      sha256 "78b6768451c89084a1d7ff9b559d6a90289b6aee214d1b1a8a5e719541abfc16"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-2-linux-amd64.gz"
      sha256 "2839ed4654120ad662aeb2f35c010e674d3fb710cc0aa98e7d26372f56226828"
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
