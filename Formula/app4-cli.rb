# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.137.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-137-0-darwin-arm64.gz"
      sha256 "498f2d5f8538320f73ea8df097ab4542e02be4f1b29f29f53044d13ad7e520b1"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-137-0-darwin-amd64.gz"
      sha256 "58226139ce6281fe8cdc2762723d14388df7fd5925a1d4b9e9cbd5d8574a6c32"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-137-0-linux-arm64.gz"
      sha256 "eeeb374d27cabc6ffa5c43f08c1dbffc9f715a98a6788d0a1e976fea49c84761"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-137-0-linux-amd64.gz"
      sha256 "6bb3439bf2ee666ec2048eba8ed85dab6271d182be5dae2a8124738c940eb5ac"
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
