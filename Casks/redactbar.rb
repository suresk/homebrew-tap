cask "redactbar" do
  version "1.0.1"
  sha256 "61552f7e0719882c987e4875901a58fe922e4da2acfe92c6f6b79bc09e62effb"

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
