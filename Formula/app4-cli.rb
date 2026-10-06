# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.74.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-74-0-darwin-arm64.gz"
      sha256 "d56a1d9cff1fba5b58977909f0a647305743f403e800428e4a6710232017e52e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-74-0-darwin-amd64.gz"
      sha256 "2ea4fb03923ac14f2912658f848de24718050976f03e8954ec55539fca9bc1a4"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-74-0-linux-arm64.gz"
      sha256 "daa5a61bc77839e2e29308a4a6e3d5afb7589aa8cd43d305a3f2301e0a3cc18d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-74-0-linux-amd64.gz"
      sha256 "10255d6faa584626d026a1d09a7dc506c60f829b81c722d9b391757e7c9ac787"
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
