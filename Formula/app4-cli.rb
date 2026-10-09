# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.82.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-82-1-darwin-arm64.gz"
      sha256 "5129c40aaedf5b9aaf975fedd048879f04de7da5a6a57feabbe08e69bca70011"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-82-1-darwin-amd64.gz"
      sha256 "834192cfd0e13ed9d9677a06fdfbe67225ebde8e63fd878e456e4f2c804aba5f"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-82-1-linux-arm64.gz"
      sha256 "8e4cba9f9e9ac9b5282179a2e2707c7feacd1fafb6a525fb97d68be69267f283"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-82-1-linux-amd64.gz"
      sha256 "d4d82824f543deeaab59903d8d697539987e9f51a334319b3c35c8eaa6b1176a"
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
