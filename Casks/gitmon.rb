cask "gitmon" do
  version "0.1.0"
  sha256 "9e04e057a6a7374055079936e1391e1a7e1a6043fed0751d44c769a7ddf50135"

  url "https://github.com/suresk/gitmon/releases/download/v#{version}/GitMon-#{version}.dmg"
  name "GitMon"
  desc "All your local git repos, branches, and unpushed work at a glance"
  homepage "https://getgitmon.com/"

  livecheck do
    url "https://github.com/suresk/gitmon/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "GitMon.app"

  uninstall quit: "com.suresk.gitmon"

  zap trash: [
    "~/Library/Preferences/com.suresk.gitmon.plist",
    "~/Library/Application Support/GitMon",
    "~/Library/Caches/com.suresk.gitmon",
    "~/Library/HTTPStorages/com.suresk.gitmon",
  ]
end
