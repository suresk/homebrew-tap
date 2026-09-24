cask "launchmon" do
  version "0.1.4"
  sha256 "9052378d4b1ab3390d5833c254569c7343957425a5fb088c1b5314c6f741380e"

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
