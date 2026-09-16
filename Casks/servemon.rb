cask "servemon" do
  version "0.1.0"
  sha256 "c4c27c790af48bcf7d18216963a4fcffa904caf05b9b98caf3ff22c55d3ddb78"

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

  uninstall launchctl: "com.suresk.servemon.helper",
            quit:      "com.suresk.servemon"

  zap trash: [
    "~/Library/Preferences/com.suresk.servemon.plist",
    "~/Library/Application Support/ServeMon",
    "~/Library/Caches/com.suresk.servemon",
    "~/Library/HTTPStorages/com.suresk.servemon",
  ]
end
