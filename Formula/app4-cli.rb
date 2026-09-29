# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.50.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-50-0-darwin-arm64.gz"
      sha256 "ac1f1e28af19cd412b62aec875a7f8474d125fd8c66bd9e69c2a37814b185fda"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-50-0-darwin-amd64.gz"
      sha256 "acdd1164a5bbaa7b4190baf972974fea100c369e3274022bb4167fb52298345b"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-50-0-linux-arm64.gz"
      sha256 "6a5abd0380f64584d14c3e71b868ef8bc2dcbca2d1c1cebe1e749349560bf6d6"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-50-0-linux-amd64.gz"
      sha256 "b888623b4386e77b6193ecf8ed41b42262b6c53339cb9b1a3a69cf029e3adb8c"
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
