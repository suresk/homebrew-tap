cask "gitmon" do
  version "0.1.1"
  sha256 "b0ac09d093d9d54943f1e70577fb5ad43f2c53ee3de309176c442b86f48b00c7"

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
