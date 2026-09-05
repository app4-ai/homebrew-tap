# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.28.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-0-darwin-arm64.gz"
      sha256 "4e8e52f56fb00c4b710830c6d3532eb731bcee0820e2ece177b5adda0a393da6"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-0-darwin-amd64.gz"
      sha256 "5147472f6a8744acf63603f711611435057e890bb3ac208b35fa3b5419c95bbc"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-0-linux-arm64.gz"
      sha256 "1676cedf8a50dc43a5af0cf8990933bb54f19e5ee05736c9c00c9751daf3008a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-0-linux-amd64.gz"
      sha256 "ea89392715569f8bd9541241357424a8180a90c5dae465c4d27958c51a0acf09"
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
