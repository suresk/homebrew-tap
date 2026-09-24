cask "certmon" do
  version "1.0.4"
  sha256 "d374a35b32fb58bb33179a6abd2770e1fb5b270bdfcbcf69b014b935b555cd1d"

  url "https://github.com/suresk/certmon/releases/download/v#{version}/CertMon-#{version}.dmg"
  name "CertMon"
  desc "Zero-config trusted local HTTPS reverse proxy and dev domains"
  homepage "https://getcertmon.com/"

  livecheck do
    url "https://github.com/suresk/certmon/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "CertMon.app"

  uninstall launchctl: "com.suresk.certmon.helper",
            quit:      "com.suresk.certmon"

  zap trash: [
    "~/Library/Preferences/com.suresk.certmon.plist",
    "~/Library/Application Support/CertMon",
    "~/Library/Caches/com.suresk.certmon",
    "~/Library/HTTPStorages/com.suresk.certmon",
  ]
end
