# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.121.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-121-0-darwin-arm64.gz"
      sha256 "381b94f92e8ba943767afd6ce7955e6a67fdf585264dd7177feacaf555101884"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-121-0-darwin-amd64.gz"
      sha256 "16d5b4b8d07559dd1f505585751f0b1872d89078a373b973b601827631b3655f"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-121-0-linux-arm64.gz"
      sha256 "613d85f856db2b2ed918025756d2ed0a9823eb75dc488292a31389c86f09ee51"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-121-0-linux-amd64.gz"
      sha256 "92ea1dba3a9376428012e73b8c7d1f2c1db0a7b5c0b560c04f27a2df6739a421"
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
