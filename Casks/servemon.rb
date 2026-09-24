cask "servemon" do
  version "0.1.2"
  sha256 "7381426593792dcf4b97978644214327096aeeecc803bf4eee66ee6333a919c5"

  url "https://github.com/suresk/servemon/releases/download/v#{version}/ServeMon-#{version}.dmg"
  name "ServeMon"
  desc "Menu bar dashboard for local backing services: Postgres, Redis, MySQL, MongoDB, Docker"
  homepage "https://getservemon.com/"

  livecheck do
    url "https://github.com/suresk/servemon/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "ServeMon.app"

  uninstall quit: "com.suresk.servemon"

  zap trash: [
    "~/Library/Preferences/com.suresk.servemon.plist",
    "~/Library/Application Support/ServeMon",
    "~/Library/Caches/com.suresk.servemon",
    "~/Library/HTTPStorages/com.suresk.servemon",
  ]
end
