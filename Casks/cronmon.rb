cask "cronmon" do
  version "0.2.1"
  sha256 "268bc4d4cfb5c50d515660f631950c4ab0a56f6188870410669517ffd299ad45"

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
