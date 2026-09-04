# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.26.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-26-1-darwin-arm64.gz"
      sha256 "58b708ca61b4d29ab14a16dbe8618384c6f44f232186378a70a46266c79aefd6"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-26-1-darwin-amd64.gz"
      sha256 "a973bcf1efd31d6412b3d51f0d63381ee6447fdbc611680e38d2df6c56e00f9b"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-26-1-linux-arm64.gz"
      sha256 "c5cb855c10c06618797230608f64f0818507b36a3657d5a79116b71808d6adf6"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-26-1-linux-amd64.gz"
      sha256 "413ce57680136280043c3e6bdbdb3ae263f39c10c7dc4bdc186d604d82d529f8"
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
