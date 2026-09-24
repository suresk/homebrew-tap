cask "gaugemon" do
  version "0.2.1"
  sha256 "2240f135feac2f7df2fe9438991296078250a09ddab87cb9deeeba51355a1a5c"

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
