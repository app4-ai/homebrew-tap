# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.32.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-0-darwin-arm64.gz"
      sha256 "96378c4f36e1bad8bd1f9ceea01985ce0a866bb22ff9f452d49dabebd59f3bad"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-0-darwin-amd64.gz"
      sha256 "f3692ff6837ea2927c1fb741349dd93959068d9413d351ec1e893cf3aae3a80f"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-0-linux-arm64.gz"
      sha256 "d05420c16c574ad662abbd64bedcf204ecb49e53517ef3c1288e91bbf96b1af0"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-32-0-linux-amd64.gz"
      sha256 "3c8cbf7649fd0b27c4ab049f184f85a576af46f7a8f6c4d39b78a57c3c720bdd"
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
