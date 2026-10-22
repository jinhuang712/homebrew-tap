# Calm Terminal (https://github.com/jinhuang712/calm). Calm's release workflow writes the
# version and sha256 here when it publishes a release.
cask "calm" do
  version "0.1.4"
  sha256 "4b60dcca7c1d60dbccd63e14526968ba916f2165fcca55ccc707675ab6bfe26f"

  url "https://github.com/jinhuang712/calm/releases/download/v#{version}/Calm-#{version}.dmg"
  name "Calm Terminal"
  desc "Minimal terminal for supervising coding agents"
  homepage "https://github.com/jinhuang712/calm"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Calm.app"
  binary "#{appdir}/Calm.app/Contents/Resources/bin/calm"

  zap trash: [
    "~/.config/calm",
    "~/.local/share/calm",
    "~/Library/Application Support/Calm",
    "~/Library/Logs/Calm",
    "~/Library/Preferences/com.jinhuang.calm.plist",
    "~/Library/Saved Application State/com.jinhuang.calm.savedState",
  ]

  # Calm isn't signed with a Developer ID yet, so macOS keeps Homebrew's download mark on it and
  # won't open it. The cask leaves taking the mark off to you, as Homebrew asks. /usr/bin/xattr by
  # path: Homebrew's own python `xattr` package, when installed, comes first and has no -r.
  caveats <<~EOS
    Calm isn't signed by Apple yet, so macOS won't open it as downloaded. After each
    install or upgrade, run once:
      /usr/bin/xattr -dr com.apple.quarantine #{appdir}/Calm.app
    macOS then asks again for access to Desktop, Documents and Downloads.

    After an upgrade, restart a running Calm (Calm → Restart Calm); your shells stay.
  EOS
end
