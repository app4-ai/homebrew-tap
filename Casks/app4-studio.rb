# typed: false
# frozen_string_literal: true

# Rendered by `make release:desktop` in app4-smart-studio from
# smart-studio/desktop/manifest.json. Do not edit by hand.
cask "app4-studio" do
  version "0.1.195"
  sha256 "3f14ad3292e042d656a8488906f8adac75e245548c9a62fc5c68ffdb98caa6a2"

  url "https://s3.app4.studio/app4-studio/smart-studio/desktop/App4Studio-#{version}.dmg"
  name "App4 Studio"
  desc "Desktop IDE for building App4 applications with AI workers"
  homepage "https://app4.dev/"

  auto_updates false
  depends_on formula: "app4-cli"
  depends_on macos: :monterey

  app "App4 Studio.app"

  zap trash: [
    "~/Library/Application Support/App4 Studio",
    "~/Library/Saved Application State/studio.app4.desktop.savedState",
    "~/Library/WebKit/studio.app4.desktop",
  ]
end
