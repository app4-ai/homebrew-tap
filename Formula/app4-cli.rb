# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.58.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-1-darwin-arm64.gz"
      sha256 "4076364ca0a153fadef60b015aafd615b894a3fffe98d74e06a8174d9e8b686c"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-1-darwin-amd64.gz"
      sha256 "59ea989ad7695736a227da88c66da79901956e1ee326b05b225af97c41c7986e"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-1-linux-arm64.gz"
      sha256 "15c3533af9312e2bd4ec5be7ee63540cc8c50e4bedec6d6c5f71a0314fefdcd4"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-58-1-linux-amd64.gz"
      sha256 "935c32268ab1d005e565b5780ee6f231676fd1cc5cecaea24916f15df08908af"
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
