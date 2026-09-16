cask "hostbar" do
  version "0.1.0"
  sha256 "8c9f5d5e2c5fb0f01a75f05bedc299ad0f9974771d52694e5cf4122c8ff1c1d6"

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
