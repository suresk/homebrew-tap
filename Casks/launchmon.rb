cask "launchmon" do
  version "0.1.1"
  sha256 "3f8a3f78d5cab4d3b54e76c290ff618cdbca0c42e06f3cae5a0891a02fe875ab"

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
