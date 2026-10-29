cask "dockyard" do
  version "0.2.7"
  sha256 "c23e2d8e124b5fce498afb9b56e4f33eb548cff30f7d47289d9479af772f9d65"

  url "https://github.com/barnolacesc/dockyard/releases/download/v#{version}/Dockyard-unsigned.dmg"
  name "Dockyard"
  desc "Run coding agents in parallel git worktrees"
  homepage "https://github.com/barnolacesc/dockyard"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Dockyard.app"
  binary "#{appdir}/Dockyard.app/Contents/Resources/dy", target: "dy"

  zap trash: [
    "~/Library/Caches/dockyard",
    "~/Library/Preferences/com.barnolacesc.dockyard.plist",
  ]

  caveats <<~EOS
    Dockyard is not yet notarized by Apple (no Developer ID — this build is
    ad-hoc signed only). macOS Gatekeeper will block it on first launch.

    To open it, do ONE of the following:
      • Right-click Dockyard.app in Finder, choose "Open", then confirm.
      • Remove the quarantine attribute manually:
          xattr -cr /Applications/Dockyard.app
  EOS
end
