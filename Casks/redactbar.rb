cask "redactbar" do
  version "1.0.0"
  sha256 "06fd264b8cfc346f735fdb953532c3f4d845586e07949ecb27afbca471669c60"

  url "https://github.com/suresk/redactbar/releases/download/v#{version}/RedactBar-#{version}.dmg"
  name "RedactBar"
  desc "Menu bar app that watches developer secret leak vectors and masks before credentials leave the machine"
  homepage "https://getredactbar.com/"

  livecheck do
    url "https://github.com/suresk/redactbar/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "RedactBar.app"

  uninstall quit: "com.suresk.redactbar"

  zap trash: [
    "~/Library/Preferences/com.suresk.redactbar.plist",
    "~/Library/Application Support/RedactBar",
  ]
end
