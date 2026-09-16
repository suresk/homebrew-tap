cask "launchmon" do
  version "0.1.0"
  sha256 "0addccded53677a464bb2304e556f642d7021114854c5a132c86d8e19c751795"

  url "https://github.com/suresk/launchmon/releases/download/v#{version}/LaunchMon-#{version}.dmg"
  name "LaunchMon"
  desc "Native launchd inventory, health monitoring, and service controls"
  homepage "https://getlaunchmon.com/"

  livecheck do
    url "https://github.com/suresk/launchmon/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "LaunchMon.app"

  uninstall launchctl: "com.suresk.launchmon.helper",
            quit:      "com.suresk.launchmon"

  zap trash: [
    "~/Library/Preferences/com.suresk.launchmon.plist",
    "~/Library/Application Support/LaunchMon",
  ]
end
