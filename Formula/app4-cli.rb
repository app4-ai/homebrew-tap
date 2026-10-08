# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.78.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-78-0-darwin-arm64.gz"
      sha256 "3c64777496c1624c8c251baf1961c7204ccae7b69103e8bd77e74cd3aff88f63"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-78-0-darwin-amd64.gz"
      sha256 "03f93529e0fcbfbba9adc81c62fa2043523fac36439113f2072dde317d7606a8"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-78-0-linux-arm64.gz"
      sha256 "33935fde4ac838c7a6dd49e98c8f9822c93bdc2b87b7f9a0cd75f6dd770e5789"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-78-0-linux-amd64.gz"
      sha256 "d88856df8b5d65fca15c1bfe1085c26d7c7850c3a112287c54fbdf7069b438e2"
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
