# homebrew-tap

Personal Homebrew tap for [Dockyard](https://github.com/barnolacesc/dockyard).

## Install

```sh
brew install --cask barnolacesc/tap/dockyard
```

Dockyard's current builds are ad-hoc signed (no Developer ID, not notarized
yet), so Gatekeeper will block the app on first launch. Either right-click
the app and choose "Open", run `xattr -cr /Applications/Dockyard.app`, or
install with quarantine disabled up front:

```sh
brew install --cask --no-quarantine barnolacesc/tap/dockyard
```
