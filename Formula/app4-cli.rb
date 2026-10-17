# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.96.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-3-darwin-arm64.gz"
      sha256 "19d278a2e9b8b35f91c31ca5a8ce5dc964fb528ca2c4d49b3375dd513b66464c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-3-darwin-amd64.gz"
      sha256 "fe5dbec7f395c058ff7496be95cb49d87654d0cd4befba6813b405cc443e6cf6"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-3-linux-arm64.gz"
      sha256 "831a1020235c1cb9c7ac089e855180d37725ff4e46d13fd9ba141e52a78c8060"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-96-3-linux-amd64.gz"
      sha256 "438fa35afd574a116c66c0a69f8fb16733f175d90fcef0499c4e830b000f92fd"
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
