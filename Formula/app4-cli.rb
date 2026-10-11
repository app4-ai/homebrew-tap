# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.83.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-83-0-darwin-arm64.gz"
      sha256 "006a963edbcc22f668f8aefb1d9f19b847b6cbf3ff9bb2cf29e76d66f5e3a246"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-83-0-darwin-amd64.gz"
      sha256 "f0ac7648f27c6aff6a1e6603d63cd5aec5d8e6c7d310f5ec483d3d4b43e26e27"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-83-0-linux-arm64.gz"
      sha256 "a07b6a00821cc111868c482351c2912f31d12b03d9c8a89e590e4214f9544438"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-83-0-linux-amd64.gz"
      sha256 "85e2910e83116933d7a0567fbc701734db23bccd112ea07de0dd7b4942e759ed"
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
