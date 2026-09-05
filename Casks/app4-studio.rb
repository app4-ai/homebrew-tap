# typed: false
# frozen_string_literal: true

# Rendered by `make release:desktop` in app4-smart-studio from
# smart-studio/desktop/manifest.json. Do not edit by hand.
cask "app4-studio" do
  version "0.1.129"
  sha256 "6dd23623251a9b90c4336f51b1a68eae1b57e1e9b3bee62f3e27a6ea66273769"

  url "https://s3.app4.studio/app4-studio/smart-studio/desktop/App4Studio-0.1.129.dmg"
  name "App4 Studio"
  desc "Desktop IDE for building App4 applications with AI workers"
  homepage "https://app4.dev"

  depends_on formula: "app4-cli"
  depends_on macos: ">= :monterey"

  auto_updates false

  app "App4 Studio.app"

  zap trash: [
    "~/Library/Application Support/App4 Studio",
    "~/Library/Saved Application State/studio.app4.desktop.savedState",
    "~/Library/WebKit/studio.app4.desktop",
  ]
end
