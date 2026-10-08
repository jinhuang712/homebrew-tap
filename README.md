# Homebrew tap

Casks for [Calm Terminal](https://github.com/jinhuang712/calm), a minimal macOS terminal that keeps you calm and focused.

```sh
brew install --cask jinhuang712/tap/calm
/usr/bin/xattr -dr com.apple.quarantine /Applications/Calm.app
```

The full name trusts just this cask, as Homebrew asks of a tap that isn't its own. Calm isn't signed with an Apple Developer ID yet, so macOS won't open it as downloaded: the `xattr` line takes the download mark off, after each install or upgrade (the one in `/usr/bin`: Homebrew's `xattr` package has no `-r`). The cask also puts the `calm` command on your `PATH`.

Calm's release workflow updates the cask when it publishes a release; `brew upgrade --cask calm` picks it up. This repository's own workflow installs the cask on a clean macOS runner after every change.
