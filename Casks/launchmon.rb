cask "launchmon" do
  version "0.1.3"
  sha256 "f44016e895067340dd1a5cfce5c30d617bdcb2bcaa0653f3b3cb9eb6b5cd00c4"

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
