cask "gaugemon" do
  version "0.1.0"
  sha256 "1f4f95ea1aa9f80b78164f6e621327ba58ae3f43724e1ffb288e8bde98fc7f4f"

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
