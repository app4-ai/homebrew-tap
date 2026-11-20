# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.142.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-142-0-darwin-arm64.gz"
      sha256 "27a42232bbb2f224c9f6bc777a6855c347777f77ca87acdeef3cd91b1596f5d6"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-142-0-darwin-amd64.gz"
      sha256 "f67bd6e07c072ffaf87477e6c6e4562a1e27122c8ef82d289b0d338c75fc0e84"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-142-0-linux-arm64.gz"
      sha256 "bdd281add7002902d611251005cf71c8201032ac65e06c919cd133a01e4d98a2"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-142-0-linux-amd64.gz"
      sha256 "ecdf8302bb5edb8be53ad621d0d182ee8793a81cc48b44e4b9ce15a88291f2ed"
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
