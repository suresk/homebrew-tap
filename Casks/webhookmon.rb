cask "webhookmon" do
  version "0.1.0"
  sha256 "0d1ede07b005bab2f526491bc8cd310e569116e24e53640821c0a9432647f625"

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
