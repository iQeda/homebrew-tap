cask "memorize" do
  version "0.6.2-20260612-0730-257e503"
  sha256 "ab91381a431c14406161979d9bdb863111faf3cb2ae4a40a1ebf7b169a4df0d2"

  url "https://github.com/iQeda/memorize/releases/download/v#{version}/Memorize_0.6.2_aarch64.dmg"
  name "memorize"
  desc "Anki-compatible spaced repetition app, vocab-focused"
  homepage "https://github.com/iQeda/memorize"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Memorize.app"

  # Unsigned binary — strip the quarantine xattr so first launch doesn't
  # require a manual right-click → Open through Gatekeeper.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Memorize.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/dev.iqeda.memorize",
    "~/Library/Caches/dev.iqeda.memorize",
    "~/Library/Preferences/dev.iqeda.memorize.plist",
    "~/Library/Saved Application State/dev.iqeda.memorize.savedState",
    "~/Library/WebKit/dev.iqeda.memorize",
  ]
end
