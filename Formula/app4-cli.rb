# typed: false
# frozen_string_literal: true

# Rendered from cli/manifest.json by `go run ./tools/homebrew render` in the
# app4-cli release pipeline. Do not edit by hand: every release opens a pull
# request that replaces this file.
class App4Cli < Formula
  desc "Command-line interface for the App4 platform"
  homepage "https://app4.dev"
  version "1.131.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-5-darwin-arm64.gz"
      sha256 "bda5f65f46f0b06e8cbc8f036519b1bcf7772b3eec847359624141fd91007c6f"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-5-darwin-amd64.gz"
      sha256 "683d498501510ce3c54e3b9c33c621b9a4afa9dec61b4784756d21dc23e1c9ef"
    end
  end

  on_linux do
    on_arm do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-5-linux-arm64.gz"
      sha256 "5f4dc7714ed326c32efed37e273ffeed3dd0f53001e66b1ae8654a379f93218a"
    end
    on_intel do
      url "https://s3.app4.studio/app4-studio/cli/app4-v1-131-5-linux-amd64.gz"
      sha256 "04ef263ed1c98c3420ec10a4b7add8f2c8c75ca7c602f00e859d95e72071b070"
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
