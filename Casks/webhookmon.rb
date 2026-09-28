cask "webhookmon" do
  version "0.1.1"
  sha256 "43263b901a4e99a9cb1832b8d6e45f5c5ed916fa71d4819a91959c991a720a38"

  url "https://github.com/suresk/webhookmon/releases/download/v#{version}/WebhookMon-#{version}.dmg"
  name "WebhookMon"
  desc "See, verify and replay Stripe, Polar, GitHub, Shopify and Slack webhooks on localhost"
  homepage "https://getwebhookmon.com/"

  livecheck do
    url "https://github.com/suresk/webhookmon/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "WebhookMon.app"

  uninstall quit: "com.suresk.webhookmon"

  zap trash: [
    "~/Library/Preferences/com.suresk.webhookmon.plist",
    "~/Library/Application Support/WebhookMon",
    "~/Library/Caches/com.suresk.webhookmon",
    "~/Library/HTTPStorages/com.suresk.webhookmon",
  ]
end
