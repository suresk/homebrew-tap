cask "eventbar" do
  version "0.1.4"
  sha256 "1224b2f5391314ba83d2bb10dce4f8fb0ac44cc69b3b607b32b93e5eafeb3444"

  url "https://github.com/suresk/eventbar/releases/download/v#{version}/EventBar-#{version}.dmg"
  name "EventBar"
  desc "Your sites post events; your menu bar shows them, with a count for the last hour, day, week and month"
  homepage "https://geteventbar.com/"

  livecheck do
    url "https://github.com/suresk/eventbar/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "EventBar.app"

  uninstall quit: "com.suresk.eventbar"

  zap trash: [
    "~/Library/Preferences/com.suresk.eventbar.plist",
    "~/Library/Application Support/EventBar",
    "~/Library/Caches/com.suresk.eventbar",
    "~/Library/HTTPStorages/com.suresk.eventbar",
  ]
end
