# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.67.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-67-0-darwin-arm64.gz"
      sha256 "1a3d6106f55cdf82ce38cb01debe8735ee3ae639ddfe007718a314942476d91a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-67-0-darwin-amd64.gz"
      sha256 "721acd9e8a098cd96cdaf45a32110a33123af33d6de8e2f8fdd23bb8b062ae9d"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-67-0-linux-arm64.gz"
      sha256 "55ab096a238116be804ddd1cefb2d9223c73bcd6df8aa916213955546dcf649b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-67-0-linux-amd64.gz"
      sha256 "e9e3dbd7dd2ea2a82cfc32da051db077e4da63e902f7a198b9f16f501feb1315"
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
