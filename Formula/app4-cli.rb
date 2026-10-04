# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.64.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-1-darwin-arm64.gz"
      sha256 "6ad033c24056653a33008ab780f97e3fee80987c43ced5ca8dd96ce14696ff1d"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-1-darwin-amd64.gz"
      sha256 "ae416fb8537df5ac4c0207415349fd8740daf5a585c3d21e33973166ec3e3143"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-1-linux-arm64.gz"
      sha256 "9d76b78fe27ab23f134f1d668a69e296d3ca100ef77345c30acc9dc896a36d4a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-64-1-linux-amd64.gz"
      sha256 "34b047702b54a7d743e78e1b4dfb91cd5094e206dbc1322c1973c7cf7da6404d"
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
