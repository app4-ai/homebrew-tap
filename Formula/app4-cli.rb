# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.130.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-130-1-darwin-arm64.gz"
      sha256 "f00b3a8b92f93a0ab3751c9ef4e7218a8516bd433f2254eb4a046f2304b736da"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-130-1-darwin-amd64.gz"
      sha256 "75e90944d3d2a2f35b735a73413227bb3321c1e9443dad38dab16c49862fb217"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-130-1-linux-arm64.gz"
      sha256 "2abd0ef49884f3d5f972caf099889465f9349003e92fa145fa280681e28b3940"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-130-1-linux-amd64.gz"
      sha256 "eff692ab464ae53d6f650480cfa239a813e86b2156b8490dcc292b20a7dc6851"
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
