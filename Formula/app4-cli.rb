# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.128.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-128-0-darwin-arm64.gz"
      sha256 "b71b368a226898be2a1e2ccd48a215c9ee81aa1317c0be6673e800b619bead82"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-128-0-darwin-amd64.gz"
      sha256 "a44ec584dd3199dd7f970a02c4b5e2afbd9726206b64e339a422de8ce730e094"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-128-0-linux-arm64.gz"
      sha256 "326e56e5b45117efd87784f2ba8f15920e391257d78e0bcf043d303e5d8626b5"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-128-0-linux-amd64.gz"
      sha256 "e76dc3710921eaf258b7c8d3523294b81cebbded34838b359330c8c6c457e88c"
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
