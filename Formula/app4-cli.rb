# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.94.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-94-1-darwin-arm64.gz"
      sha256 "0f415e09647931306810c92efd08defb8ca21bc73d28f664f4adcab1189a3abf"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-94-1-darwin-amd64.gz"
      sha256 "1321d8aa400788f0aab06101841c2ddd014915a6fe49e6919ecd3ed796f6c974"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-94-1-linux-arm64.gz"
      sha256 "6728b6e2005712ecaa5bffc3defa8831d81bae38715c1997e104a3639619ac1b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-94-1-linux-amd64.gz"
      sha256 "df6999a289278145d919a163e9d56122c3055b6687882f7ccc533d58bee4319a"
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
