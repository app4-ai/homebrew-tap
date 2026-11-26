# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.146.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-146-0-darwin-arm64.gz"
      sha256 "9751158fa864661345b531a63e879996d31d55a4c149795ff0574dda8891bd8f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-146-0-darwin-amd64.gz"
      sha256 "b9ff6ba76a503a49bc39c66a514f5afdf9b9405daf42fe737c2c23ec0fe31957"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-146-0-linux-arm64.gz"
      sha256 "b7a18ca4cb9e9f667a529d774b57bea437039382f35feba13f47d826975803d4"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-146-0-linux-amd64.gz"
      sha256 "7200ed52c459c98f55700aad15d56faf7d2647a908f9f6833eea7b6461c2140f"
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
