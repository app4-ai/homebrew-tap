# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.69.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-69-1-darwin-arm64.gz"
      sha256 "022f08702d304ed70a685fa5dace947672e12739c3307be8e303c23a42a247f4"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-69-1-darwin-amd64.gz"
      sha256 "52b9821d7aa3aeb4cb561641199cf62fb5c1dfdaa3efb07feb453fbff90e4bbe"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-69-1-linux-arm64.gz"
      sha256 "5c661dc93f632d784800f25e59d515d47bf08f4d62d2b6d00cda8627d82d1563"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-69-1-linux-amd64.gz"
      sha256 "ce531373821502172ff68a67fe4368eb696fffe4d2f19d558555d482d0525cc7"
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
