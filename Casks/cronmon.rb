cask "cronmon" do
  version "0.2.2"
  sha256 "629b58f0706e08fd58ad5ef360a5aeebec3a50b7a77c567c793312845e58088e"

  url "https://github.com/suresk/cronmon/releases/download/v#{version}/CronMon-#{version}.dmg"
  name "CronMon"
  desc "Every cron and launchd scheduled job on your Mac, with next runs on a timeline"
  homepage "https://getcronmon.com/"

  livecheck do
    url "https://github.com/suresk/cronmon/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "CronMon.app"

  uninstall quit: "com.suresk.cronmon"

  zap trash: [
    "~/Library/Preferences/com.suresk.cronmon.plist",
    "~/Library/Application Support/CronMon",
    "~/Library/Caches/com.suresk.cronmon",
    "~/Library/HTTPStorages/com.suresk.cronmon",
  ]
end
