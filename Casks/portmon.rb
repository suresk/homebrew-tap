cask "portmon" do
  version "0.9.0"
  sha256 "b2e772241e4f4018f35adb18cd128f1ff96f93626cc500adea1d91b200d27b11"

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
