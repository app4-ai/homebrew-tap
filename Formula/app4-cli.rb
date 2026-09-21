# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.39.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-39-0-darwin-arm64.gz"
      sha256 "71013155e73ad83a46a4302828fa113dcc0b43518b57a228912ce01482b4872b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-39-0-darwin-amd64.gz"
      sha256 "f62bdcf149c3bb76cdd1753a96208d04927f18c91cea9e3ccf5312456a215805"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-39-0-linux-arm64.gz"
      sha256 "09769149e0ddf8aa328d89e1cc60ca29dc9c1b7a2e5d8d3efac5ad914f3fa343"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-39-0-linux-amd64.gz"
      sha256 "a8bdd10c2fa93b114df55e156c25b479d12498ebe5bc2588bb7b0727988001f4"
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
