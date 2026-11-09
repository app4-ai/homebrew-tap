# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.132.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-9-darwin-arm64.gz"
      sha256 "2ecf48e37aecb04b8cf6d84036229aa4a65a96b4621f92a8efbd2390e55c6e02"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-9-darwin-amd64.gz"
      sha256 "136c0cfcb25e9b4ccedf454a50ccb6a48847158cdbaceea4eedb4908487a69b0"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-9-linux-arm64.gz"
      sha256 "85cdccb7505b4dae551a355cbd0386f82f6c102809bb5bddd8a791dec42f621e"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-132-9-linux-amd64.gz"
      sha256 "3403b06966a60b8fc79660c39291129fe594875e4b295c7675af1a4241b64038"
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
