# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.61.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-61-0-darwin-arm64.gz"
      sha256 "72a07c1a50913625b583e71885f9d6117c661ea41206508ea24b0def06046fca"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-61-0-darwin-amd64.gz"
      sha256 "4c5b16cfd7615d2c3b8f67485c4e9a982fd2a5fc32f401023a67faa9fbb3e839"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-61-0-linux-arm64.gz"
      sha256 "6b74c0b28e5f45b8599a12dbf4283eadad35ff7797e47492a50e75404830d0b1"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-61-0-linux-amd64.gz"
      sha256 "a6fa5aa7e8b922e1b93d796c190b513a8112bf2227340b6ef454253219f7bfa2"
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
