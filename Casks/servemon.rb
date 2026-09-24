cask "servemon" do
  version "0.1.3"
  sha256 "803e0dae1c9a0981060863cc8eac552f102740bef4aab76e7f0abd559a9ea6cc"

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
