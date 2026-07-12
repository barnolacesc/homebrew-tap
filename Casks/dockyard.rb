cask "dockyard" do
  version "0.2.1"
  sha256 "e35f6967ac7030c494b850dd2160bf92a0d7972c1f022e55bffec53e85df2e01"

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
      • Reinstall with Homebrew's quarantine flag disabled:
          brew install --cask --no-quarantine barnolacesc/tap/dockyard
  EOS
end
