# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.124.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-124-0-darwin-arm64.gz"
      sha256 "1dd85406d9b719bb09897a99afafecd339f561a1f988fc2c1af4e6f7259de094"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-124-0-darwin-amd64.gz"
      sha256 "0fb96ebf94309179fa2e0cf5b132906e1591a76bfb271326d4090d787f342d6a"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-124-0-linux-arm64.gz"
      sha256 "9ad98c471b71f33189ea0229e1e38ec14f9de89270f7eadf421ec8b6b15a7694"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-124-0-linux-amd64.gz"
      sha256 "d40d6d9cb785bf6a825f300cc0c49b348854665308195540742e8dfae15224ca"
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
