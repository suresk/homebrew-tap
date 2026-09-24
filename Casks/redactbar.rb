cask "redactbar" do
  version "1.0.2"
  sha256 "ef68af044edfc81aca8f74c05b0cf83b8b429c2bc01d63af75b7fe65c9d6f2d2"

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
