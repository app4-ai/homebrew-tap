# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.77.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-77-0-darwin-arm64.gz"
      sha256 "04f7c12ad6120613acf05d0b24a177b88c8c1d6005e2ec0c190dfed0d79bd98f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-77-0-darwin-amd64.gz"
      sha256 "08672ed91ac9807ece2634f0843ebe603721f2abf7da6149b21fb9dc36cc0e09"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-77-0-linux-arm64.gz"
      sha256 "593505ee1e71954b8229f24211400b312956a3ca7d220351c578e0668f34bb9f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-77-0-linux-amd64.gz"
      sha256 "c57bfb65619e40880109932a4ebdd7e7e4442b5af9bc5a1f8f31445a15b3b8d7"
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
