cask "hostbar" do
  version "0.1.2"
  sha256 "8bb47ec597d54f54a201779b9b8cf2781fc0af00d1fc01bff5b0d7e74d0010c7"

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
