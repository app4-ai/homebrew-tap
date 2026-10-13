# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.88.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-88-0-darwin-arm64.gz"
      sha256 "f9d5a33bdd22cda63d7c2b02804e0506917b92f14a8e16995b3c57aca70970f9"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-88-0-darwin-amd64.gz"
      sha256 "12511260db1d02cca31846808c0f035832c65c6acc9efe5af96a55343637bfa9"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-88-0-linux-arm64.gz"
      sha256 "cba0989605a57cc042e52fe5ff4f072452c69cbee5dea43b2a6682a20997aaec"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-88-0-linux-amd64.gz"
      sha256 "cbef505c8230cc9161f1ca4b6321de8c688a238fc808e6082c39abbcd97c5b55"
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
