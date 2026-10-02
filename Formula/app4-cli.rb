# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.62.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-62-1-darwin-arm64.gz"
      sha256 "f9016f437c64eeea812faae6a9b2c0bab59521832337a9c2f816b53db78b6db8"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-62-1-darwin-amd64.gz"
      sha256 "6b5bdc573b64466de40cce94baf79646689f7067870a185b0b5223489d486d16"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-62-1-linux-arm64.gz"
      sha256 "5feca5217f353033aebf19df7875e03969614b5e40d22ef2dae45f350efc52f0"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-62-1-linux-amd64.gz"
      sha256 "3a9981303b5e250be5244ee5a521cea0210acdc66f88553df882dd121b61076d"
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
