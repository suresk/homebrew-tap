cask "hostbar" do
  version "0.1.1"
  sha256 "e0c14adb0f805e4a160669ebf982123eecc79398b5baa3ea3907cfde29b5efd3"

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
