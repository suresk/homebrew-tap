cask "portmon" do
  version "1.0.5"
  sha256 "345c537bc1d9253a8683a735ca340d3d7881ae3c5c0253fbf670bb031aeedf41"

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
