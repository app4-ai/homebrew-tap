# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.86.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-1-darwin-arm64.gz"
      sha256 "419d06cb13a3f5303d0da4a7e222169e3fd7be822a4ef10047750f2c5c6073cf"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-1-darwin-amd64.gz"
      sha256 "4b796890306305ab673b34183db7e8b2a401542f0f46ea53a3dd597e71c5550a"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-1-linux-arm64.gz"
      sha256 "a1790c9f33af2076700c821f3ae722d4eda27637e31d789f2227e2afec8ebfe2"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-1-linux-amd64.gz"
      sha256 "8bc8000a8960712a3d0938a035e810be852bd5e3e9e607bb6fe1822648aa7a1e"
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
