# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.133.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-133-0-darwin-arm64.gz"
      sha256 "02b2726316873872dfba5e364d50002570008e2b11582a48e1932ae897f453ca"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-133-0-darwin-amd64.gz"
      sha256 "ffe5f670d1d01d76a1257446fc2b35593f6ff564225ea9358d47254cfdb95c8d"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-133-0-linux-arm64.gz"
      sha256 "0abfb7267f6bafcc5a2c87b302f4b88aae2f65e121585b2d5b58f763209f7731"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-133-0-linux-amd64.gz"
      sha256 "2ec030db36a4f974d5ba98c5fabb0fef47d64d8428326bd8990f4b7a2b956b04"
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
