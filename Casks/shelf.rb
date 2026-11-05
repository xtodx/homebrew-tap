cask "shelf" do
  version "1.0.0"
  sha256 "706405b6e2790e5e309d8f5603863e77f88db187d3222e7bb815789f742c5a7b"

  url "https://github.com/xtodx/shelf/releases/download/v#{version}/Shelf-#{version}.dmg"
  name "Shelf"
  desc "Park inactive projects on a NAS, disk or cloud and restore them in one click"
  homepage "https://xtodx.github.io/shelf/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Shelf.app"

  uninstall quit: "com.tonylovepony.shelf"

  # Archives on your shelves are never touched; this only removes the app's own state on this Mac.
  zap trash: [
    "~/Library/Application Support/Shelf",
    "~/Library/Caches/com.tonylovepony.shelf",
    "~/Library/Preferences/com.tonylovepony.shelf.plist",
  ]
end
