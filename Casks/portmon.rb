cask "portmon" do
  version "1.0.2"
  sha256 "2d41b63671634b74b0075fd0fecc594c110d4c5b59af20c55a0548041bc85b67"

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
