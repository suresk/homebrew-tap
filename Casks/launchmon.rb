cask "launchmon" do
  version "0.1.2"
  sha256 "afce8a514d58cfab4966d8f2c77c677ddcc7d161389c56a0b60f2b0d73bdbb6b"

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
