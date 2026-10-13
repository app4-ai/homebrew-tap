# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.86.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-3-darwin-arm64.gz"
      sha256 "f157033314c7d13c903de4a94250ef28856a48fbe63a0a5ff1483a0fb9c09cc7"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-3-darwin-amd64.gz"
      sha256 "42679220bed13e986328f6788e4a32513f202be44b7ae649f7f1ae26f63d7a88"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-3-linux-arm64.gz"
      sha256 "d0ae859975e11864794ffaee64e61576e95486fd2be5f934072546a15f2c1f84"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-86-3-linux-amd64.gz"
      sha256 "24a9e8cdcb0bb169655c6d3bb475de48fe7de1f5e1cff4ef6812e315e46af353"
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
