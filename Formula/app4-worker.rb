# typed: false
# frozen_string_literal: true

# Rendered from the worker release's SHA256SUMS by
# `scripts/worker/render-formula.sh` in the app4-smart-studio release pipeline.
# Do not edit by hand: every release opens a pull request that replaces this file.
class App4Worker < Formula
  desc "App4 Studio worker: runs agent sessions on this machine"
  homepage "https://app4.dev"
  version "0.1.171"
  license "Apache-2.0"

  depends_on "app4-cli"

  on_macos do
    on_arm do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/studio-v-0.1.171/app4-worker-darwin-arm64.tar.gz"
      sha256 "1b5c6df8d97cc221f89bd17aa38de4ce65a1f02b30c991afeac9bb9a3649b933"
    end
  end

  on_linux do
    on_intel do
      url "https://s3.app4.studio/app4-studio/smart-studio/workers/studio-v-0.1.171/app4-worker-linux-amd64.tar.gz"
      sha256 "2a038facaac50059f5dd65266465ce146a750bcab3ed166705881defa92a9c7a"
    end
  end

  def install
    supported = (OS.mac? && Hardware::CPU.arm?) || (OS.linux? && Hardware::CPU.intel?)
    odie "app4-worker ships for Apple Silicon and Linux x86_64 only" unless supported
    bin.install "app4-worker", "studio-mcp-bridge", "app4-test-runner", "app4-test-runner-pwinstall"
    (pkgshare/"skills").install Dir["skills/*"]
  end

  def caveats
    <<~EOS
      Register this machine as a worker with a token from app4.studio › Workers › Add worker:
        app4-worker register --token <token>
      Update it on this machine with `app4-worker update`.
    EOS
  end

  test do
    assert_equal "studio-v-#{version}", shell_output("#{bin}/app4-worker --version").strip
  end
end
