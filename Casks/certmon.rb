cask "certmon" do
  version "1.0.1"
  sha256 "fdced6788cd38468448b18cfa10260aab76722571b4e9de9ccddd924889cb028"

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
