# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.145.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-145-0-darwin-arm64.gz"
      sha256 "cbce8879b2a50f98cd384daec5fb1520e26370747e38f3d36689ba1871632e9c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-145-0-darwin-amd64.gz"
      sha256 "a98caa70951a7d8ae6cb7200d28c6632a0c4d2eff9339980890ea097a647a6a8"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-145-0-linux-arm64.gz"
      sha256 "e737b930ae02ef127c6b89fa4dde835b94e5a20529e0cecd1af402953724d7fb"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-145-0-linux-amd64.gz"
      sha256 "92e9913d483a7111404423a6b195a51b1855bfa6927f3ea5b2f5a57437a565be"
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
