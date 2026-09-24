cask "gaugemon" do
  version "0.2.0"
  sha256 "4ca414c9b7a4ca749bf67e6c464b735ac2a62bafd73d31048a3d2d82af3f8101"

  url "https://github.com/suresk/gaugemon/releases/download/v#{version}/GaugeMon-#{version}.dmg"
  name "GaugeMon"
  desc "Activity Monitor, htop and mactop in your menu bar"
  homepage "https://getgaugemon.com/"

  livecheck do
    url "https://github.com/suresk/gaugemon/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "GaugeMon.app"

  uninstall launchctl: "com.suresk.gaugemon.helper",
            quit:      "com.suresk.gaugemon"

  zap trash: [
    "~/Library/Preferences/com.suresk.gaugemon.plist",
    "~/Library/Application Support/GaugeMon",
    "~/Library/Caches/com.suresk.gaugemon",
    "~/Library/HTTPStorages/com.suresk.gaugemon",
  ]
end
