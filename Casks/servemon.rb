cask "servemon" do
  version "0.1.1"
  sha256 "c5e29643c54f62c381506f2bde71e836f6f877773700bd7ecc9b973cc6eaaa86"

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
