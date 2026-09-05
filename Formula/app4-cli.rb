# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.28.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-1-darwin-arm64.gz"
      sha256 "5ce691315e81262527a63c8f4ec6ccee6c3cd08c819d3b90d47b4c4832e3ef06"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-1-darwin-amd64.gz"
      sha256 "7d3e45628c45eb26115064a64b5af580f248cc621aa004ba1dbec673fec7e31c"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-1-linux-arm64.gz"
      sha256 "6d52dece23c218eb268958ccf4f8d16faffa80c986291ad1458c4305fa452047"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-28-1-linux-amd64.gz"
      sha256 "49ba8d3a49e1f47a21838d149201407a2831fadbfcdd534daf39806d4bd5deb5"
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
