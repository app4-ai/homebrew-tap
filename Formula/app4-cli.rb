# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.113.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-113-0-darwin-arm64.gz"
      sha256 "68cbf03bd36b06fa659f2b40f645085946aaf64804ab2e98585616be1daaa34f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-113-0-darwin-amd64.gz"
      sha256 "10c96f278aa738cb05cb1135b17aea13ac89a572ad795c66f3858a2caf14b7f9"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-113-0-linux-arm64.gz"
      sha256 "f4e87b3fdc8ff61f772aaebf5f0dc971d7d3038c734b7c93c140e064418d645a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-113-0-linux-amd64.gz"
      sha256 "8907fd26840f75c52ae1b092155f18a86803df7ad71dc139500bf418394184bb"
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
