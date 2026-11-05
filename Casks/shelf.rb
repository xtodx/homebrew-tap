cask "shelf" do
  version "1.0.1"
  sha256 "b1114d28d9a511780f8ef523ca5647d24a5d4b81bbf4510b4fb31838ee5b28e2"

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
