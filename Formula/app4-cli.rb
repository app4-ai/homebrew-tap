# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.131.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-1-darwin-arm64.gz"
      sha256 "124dba41272c0d8903852bffa4a621cc0846858fd03f6bda124530465f741097"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-1-darwin-amd64.gz"
      sha256 "6a325af175cf2edfd8dc04092ad61f8c566dd4abefdf9cab8de8a324ed1f69c9"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-1-linux-arm64.gz"
      sha256 "7660f5ea50884a3967cd66dfc934c74b06dbd30653675786c401cdfe566c6768"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-1-linux-amd64.gz"
      sha256 "fbf68f2011155299a56cdf3762bf6c1783fb0bdba346b00046d05e612f091d0a"
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
