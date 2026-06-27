cask "memorize" do
  version "0.7.0-20260627-0959-dbd1d1b"
  sha256 "36b5931f5f994fa4c65e7816d7f2952a80bcd017da411e6cefa061bb21cb4346"

  url "https://github.com/iQeda/memorize/releases/download/v#{version}/Memorize_0.7.0_aarch64.dmg"
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
