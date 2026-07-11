cask "dockyard" do
  version "0.2.0"
  sha256 "cee790d5422196d4f2f9958d004f06308ccd3660219a97944830d977dfa9e0c6"

  url "https://github.com/barnolacesc/dockyard/releases/download/v#{version}/Dockyard-unsigned.dmg"
  name "Dockyard"
  desc "Run coding agents in parallel git worktrees"
  homepage "https://github.com/barnolacesc/dockyard"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

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
