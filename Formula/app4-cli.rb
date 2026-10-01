# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.59.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-2-darwin-arm64.gz"
      sha256 "cf1360e840f332cb477b90846ba31de4df1ac950b66249d2ce0fafc29d80642b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-2-darwin-amd64.gz"
      sha256 "6f35818c072705ae335e2c4d4d32a627bfca3a09c3d06cf2971ba6c80fd13923"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-2-linux-arm64.gz"
      sha256 "2e6d4782508dacc686165d7efb8564e4d11a7d1aa11a0ef071f6ef2c4dee880e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-59-2-linux-amd64.gz"
      sha256 "ef84ed28ae1dabe55abe95c3ccb0b210c268138c7307f0e6915b8a4ceed8e29d"
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
