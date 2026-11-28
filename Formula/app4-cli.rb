# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.152.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-152-0-darwin-arm64.gz"
      sha256 "e97ad86234f29ab0714439bb5fd0937b49aeac0c2154ac50655f5e3b2d437fa0"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-152-0-darwin-amd64.gz"
      sha256 "cb24da3ef33310cfca70f51c9adcbbc1658e10abdd1bade0fcadc72e53f949ef"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-152-0-linux-arm64.gz"
      sha256 "0e76454fc9e771747eaf7e4e1d32847b87894e557de634ec5e621a92177618c9"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-152-0-linux-amd64.gz"
      sha256 "e70054e4cca33d299ae95eb3cb1646224a38d0a581869e6160134e63b6d3d8da"
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
