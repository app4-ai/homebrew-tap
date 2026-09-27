# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.41.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-41-1-darwin-arm64.gz"
      sha256 "4891aad4b47945bd78cf39e37f1d72b41bcc8ca1a6d067cf46015be3deceea75"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-41-1-darwin-amd64.gz"
      sha256 "feb6edd9f8681fba8c79fa82b4c8a0df5f937ae82eb355e37e56c5553dca1788"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-41-1-linux-arm64.gz"
      sha256 "b42fd126abf840ebca4589e0e23dc400cccc2ab4eca13599d26df8ba4a93092b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-41-1-linux-amd64.gz"
      sha256 "e0f934b2ea44b32e2bbe42c9abd5a8f89fb0f29c540dc3334ef4429a917cba14"
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
