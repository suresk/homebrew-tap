cask "portmon" do
  version "1.0.4"
  sha256 "ddd17bb572e2e1e649a9e43bcb19400e2909b6cb2a964c3f5e741ea6402fa89c"

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
