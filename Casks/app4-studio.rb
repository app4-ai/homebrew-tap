# typed: false
# frozen_string_literal: true

# Rendered by `make release:desktop` in app4-smart-studio from
# smart-studio/desktop/manifest.json. Do not edit by hand.
cask "app4-studio" do
  version "0.1.234"
  sha256 "c6f11ccc847e908a6963e173068e5ef9c5d2343a2fad910f27dd36468fb89f37"

  url "https://s3.app4.studio/app4-studio/smart-studio/desktop/App4Studio-#{version}.dmg"
  name "App4 Studio"
  desc "Desktop IDE for building App4 applications with AI workers"
  homepage "https://app4.dev/"

  auto_updates false
  depends_on formula: "app4-cli"
  depends_on macos: :monterey

  app "App4 Studio.app"

  # No `uninstall launchctl:` stanza on purpose: Homebrew runs it on every
  # upgrade, booting the background service out and deleting its plist while
  # nothing restarts it. App4 Studio stops and re-ensures the service itself.
  zap trash: [
    "~/Library/Application Support/App4 Studio",
    "~/Library/LaunchAgents/com.app4.studio-engine.plist",
    "~/Library/Logs/app4-studio",
    "~/Library/Saved Application State/studio.app4.desktop.savedState",
    "~/Library/WebKit/studio.app4.desktop",
  ]
end
