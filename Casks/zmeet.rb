cask "zmeet" do
  version "1.17.2"
  sha256 "5f92dbd16af3191971a2cee5c5c0ed94ebdb65dd356ef496f3a70571f8ca5f9e"

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
    "~/Library/Caches/edu.umontana.zmeet",
    "~/Library/HTTPStorages/edu.umontana.zmeet",
    "~/Library/Preferences/edu.umontana.zmeet.plist",
  ]

  caveats <<~EOS
    Meeting notes and recordings in ~/Documents/zMeet are never touched by
    Homebrew, including on uninstall/zap.
  EOS
end
