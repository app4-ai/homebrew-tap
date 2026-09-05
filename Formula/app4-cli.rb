# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.28.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-2-darwin-arm64.gz"
      sha256 "c2d78fc0de7eec3e7861a4ec71ac8b800b1b13713364f6dd6bf239520a96caeb"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-2-darwin-amd64.gz"
      sha256 "69303af6f33f660c148347b501365ff6c19621e86450ae8ab327024e0162a654"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-2-linux-arm64.gz"
      sha256 "65bd3ccb2971511b408631e39313147311404320a9656ece713a206fe93767d8"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-2-linux-amd64.gz"
      sha256 "363d9fad96d68bbf6006df9f7962b01612c4dfe6bc77ba8d3d3df02fdb40d033"
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
