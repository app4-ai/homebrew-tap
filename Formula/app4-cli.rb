# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.144.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-0-darwin-arm64.gz"
      sha256 "04079f0f0d8b102dd5f634c10435dff845d6deafc15947e926ada81246980ff3"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-0-darwin-amd64.gz"
      sha256 "4abd240b11e27e48fabb188b27dfc2951c17a4466ee02e69485cd5afc11645bd"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-0-linux-arm64.gz"
      sha256 "bb06c229d387144111d781f4e0050b74f72202bf7e77742a42ddaff4ed6ac70a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-144-0-linux-amd64.gz"
      sha256 "8af5c771437b8064980993cf43767a1d0d49f2ed61f6fd2af4ae60c6066ec23c"
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
