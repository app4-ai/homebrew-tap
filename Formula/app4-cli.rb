# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.27.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-27-1-darwin-arm64.gz"
      sha256 "e4f60cc663999524a1b6e9b6ee6dd7e76624227e6316b31d9c3bd54c70e45137"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-27-1-darwin-amd64.gz"
      sha256 "09bde871d7057770f70796615a57a4632b1f6a02b4d539745aba26f6e08a7c49"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-27-1-linux-arm64.gz"
      sha256 "da924f5ffc67601323fc0c141e95ecbe437d158ebdb8fb62e022078bbd40ce29"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-27-1-linux-amd64.gz"
      sha256 "d9f716fc37b092504e289927dc93d38980aed969915135e778ef33451654dfbe"
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
