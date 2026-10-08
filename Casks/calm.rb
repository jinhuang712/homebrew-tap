# Calm Terminal (https://github.com/jinhuang712/calm). Calm's release workflow writes the
# version and sha256 here when it publishes a release.
cask "calm" do
  version "0.1.0"
  sha256 "e865b077404a3b37dfce60b1f26f086a946ac3eff5f3c3d97db466b0f6abe325"

  url "https://github.com/jinhuang712/calm/releases/download/v#{version}/Calm-#{version}.dmg"
  name "Calm Terminal"
  desc "Minimal terminal for supervising coding agents"
  homepage "https://github.com/jinhuang712/calm"

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

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
  # won't open it. The cask leaves taking the mark off to you, as Homebrew asks.
  caveats <<~EOS
    Calm isn't signed by Apple yet, so macOS won't open it as downloaded. After each
    install or upgrade, run once:
      xattr -dr com.apple.quarantine #{appdir}/Calm.app
    macOS then asks again for access to Desktop, Documents and Downloads.

    After an upgrade, restart a running Calm (Calm → Restart Calm); your shells stay.
  EOS
end
