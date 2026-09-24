cask "portmon" do
  version "1.0.3"
  sha256 "378e99acdd4ba93450ea394d18b01c697af2774974a1d3c0776bdfd745fc6307"

  url "https://github.com/suresk/portmon/releases/download/v#{version}/PortMon-#{version}.dmg"
  name "PortMon"
  desc "Menu bar app that maps every listening port to its process, project, and container"
  homepage "https://getportmon.com/"

  livecheck do
    url "https://github.com/suresk/portmon/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "PortMon.app"

  uninstall launchctl: "com.suresk.portmon.helper",
            quit:      "com.suresk.portmon"

  zap trash: [
    "~/Library/Preferences/com.suresk.portmon.plist",
    "~/Library/Application Support/PortMon",
  ]
end
