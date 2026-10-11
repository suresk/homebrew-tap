cask "eventbar" do
  version "0.1.5"
  sha256 "e6f93b7fd4fa7eed0e90c43d3e267d4786a22210b170be71ef87f0ceafa7344a"

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
