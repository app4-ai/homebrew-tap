# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.34.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-34-0-darwin-arm64.gz"
      sha256 "27bb7aef8ff719750669e35f0b6c04fb424ebe89af19469fe06f98650fc5ccb1"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-34-0-darwin-amd64.gz"
      sha256 "88e23792c1d301f2b21ca4b262da9a052a633b65b92a0c403f2aaf4250ac4da3"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-34-0-linux-arm64.gz"
      sha256 "a1885aa3b02edfeabd270e7822193efe1f874690ea546f541579971537d74801"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-34-0-linux-amd64.gz"
      sha256 "426be34e92d7d358c0a26e6f1d66ba87f2db9fedd9deaf31e28bfbd29faac0b5"
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
