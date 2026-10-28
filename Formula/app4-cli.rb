# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.120.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-120-0-darwin-arm64.gz"
      sha256 "3dd52a187813fd12868c1f8947d16dc893b1b047b28e59c14177e2efbf5a4bef"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-120-0-darwin-amd64.gz"
      sha256 "7c32d6cbc9a13cb719de76ed8b612068f5622adbabf147205559dad8a89d311c"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-120-0-linux-arm64.gz"
      sha256 "c9d79c99598419a0676223f79881e2d8d7bd1c9196c57fc016586cee629f544b"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-120-0-linux-amd64.gz"
      sha256 "024d73cd7f197b7350715a63e6ca97a5bc8f41e27b966579ee0053bec145ef70"
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
