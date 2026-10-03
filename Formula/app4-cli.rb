# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.63.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-2-darwin-arm64.gz"
      sha256 "3d6648206f3e3c099654ddccb72cc80b452ae613ac98cf81a48069bac0fc0d7c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-2-darwin-amd64.gz"
      sha256 "556c95535a523c3b9bffe54e346301c28a3829746c21fa9d1df7fd81c06193cf"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-2-linux-arm64.gz"
      sha256 "bed7caf13106260eab45611c6d3486d6f465869cf7cbf156cc7cb35c5f280bf3"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-63-2-linux-amd64.gz"
      sha256 "c70bbbdcc675db25eac65844411fbcc5ee1abdbcb9a1c0f0b242c443e90b2c4c"
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
