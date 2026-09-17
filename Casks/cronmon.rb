cask "cronmon" do
  version "0.1.0"
  sha256 "083edcb60f15d78bd904688eb049865cfaeab108e767c5699b708da0ee1b4643"

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
