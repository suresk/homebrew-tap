cask "hostbar" do
  version "0.1.5"
  sha256 "a746a59172b8ddb9dc32bf799889759b7993e52e74edffb58531c94f81e88452"

  url "https://github.com/suresk/hostbar/releases/download/v#{version}/HostBar-#{version}.dmg"
  name "HostBar"
  desc "Toggleable hosts-file overrides with expiry and a resolve panel"
  homepage "https://gethostbar.com/"

  livecheck do
    url "https://github.com/suresk/hostbar/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "HostBar.app"

  uninstall launchctl: "com.suresk.hostbar.helper",
            quit:      "com.suresk.hostbar"

  zap trash: [
    "~/Library/Preferences/com.suresk.hostbar.plist",
    "~/Library/Application Support/HostBar",
    "~/Library/Caches/com.suresk.hostbar",
    "~/Library/HTTPStorages/com.suresk.hostbar",
  ]
end
