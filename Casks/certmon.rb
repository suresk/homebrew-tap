cask "certmon" do
  version "1.0.3"
  sha256 "b854c2fd89ee17711d56869e91dc5de1f31b33cea3a50b759fa38bc3e8658f81"

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
