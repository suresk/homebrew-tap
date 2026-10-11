cask "eventbar" do
  version "0.1.0"
  sha256 "2f5133cce177daf8f8f4a25214272473bc0d0e9353043ef2acaec14bc41833ed"

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
