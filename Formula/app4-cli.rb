# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.127.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-127-0-darwin-arm64.gz"
      sha256 "897c33edd121edaded252f32cdaa506b16c340ddd31e61b01dbe8c5a0c023d61"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-127-0-darwin-amd64.gz"
      sha256 "1ece9e69b599715319f4967ff7588016bb479da90a03b564fd142527752ca3f7"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-127-0-linux-arm64.gz"
      sha256 "44f399064494d677d31e7e74eff597c440cf7002dadd4be64db6d10f1a4d53e2"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-127-0-linux-amd64.gz"
      sha256 "bd0be70a59ad8f1f4c6daf8bd2a7f065b01cff08445da298ee56ecd3bfe6111a"
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
