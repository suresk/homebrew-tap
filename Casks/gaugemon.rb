cask "gaugemon" do
  version "0.2.2"
  sha256 "0eacd43ecf5ffdef87101c70aed127f4e33555639f3a8fc8557d2be930ac387b"

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
