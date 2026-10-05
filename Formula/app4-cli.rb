# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.73.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-73-0-darwin-arm64.gz"
      sha256 "db8af8b522d8a32828a479c5e253151c78328bef416bc9def0195e2939cf0704"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-73-0-darwin-amd64.gz"
      sha256 "913061fe8b62f52dba75e83ff78dc85a1acbfcd76f0a248ef9c1b15f05230ea3"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-73-0-linux-arm64.gz"
      sha256 "8e063b73dd76fffbfcd27383c65889c342d1911757ddb3759c4e428c36c7c4b5"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-73-0-linux-amd64.gz"
      sha256 "c6166bf6143db64f6d3f680b8cdfb2ba8fae2797d78e49d66321aac01156a698"
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
