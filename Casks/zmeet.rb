cask "zmeet" do
  version "1.19.0"
  sha256 "a9988c1d9a8f1d976d130d8eda1a8219329c14176aaf54eaff496778acd26bb3"

  url "https://github.com/umzcio/zMeet/releases/download/v#{version}/zMeet-#{version}.dmg"
  name "zMeet"
  desc "Private, on-device meeting notes — records, transcribes, and summarizes locally"
  homepage "https://github.com/umzcio/zMeet"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "zMeet.app"

  zap trash: [
    "~/.zmeet",
    "~/Library/Caches/com.zapps.zmeet",
    "~/Library/Caches/edu.umontana.zmeet",
    "~/Library/HTTPStorages/com.zapps.zmeet",
    "~/Library/HTTPStorages/edu.umontana.zmeet",
    "~/Library/Preferences/com.zapps.zmeet.plist",
    "~/Library/Preferences/edu.umontana.zmeet.plist",
  ]

  caveats <<~EOS
    Meeting notes and recordings in ~/Documents/zMeet are never touched by
    Homebrew, including on uninstall/zap.
  EOS
end
