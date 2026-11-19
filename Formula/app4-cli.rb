# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.141.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-141-0-darwin-arm64.gz"
      sha256 "66494aa97ff7e7185bb452d4d260b34d7bc95921307b46f6edd46fa8c49a05d7"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-141-0-darwin-amd64.gz"
      sha256 "541419c0877fb5c88bd2e7f81ec9114357b105be24185c35c2b9b033779fcbca"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-141-0-linux-arm64.gz"
      sha256 "d38571b3577d7bdee2103384d6ee34d2bada97f5493530befb036ab59ad00be7"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-141-0-linux-amd64.gz"
      sha256 "82feaac9afbb7a13c27c5e110b3b2bee19cbea2499da4a1022781106252e0840"
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
