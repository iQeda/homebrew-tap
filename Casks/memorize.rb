cask "memorize" do
  version "0.1.0"
  sha256 "b00a8e5403cfa33b34e4e36d61064380ec47b127df2c4c13848d3569555c2580"

  url "https://github.com/iQeda/memorize/releases/download/v#{version}/memorize_#{version}_aarch64.dmg"
  name "memorize"
  desc "Anki-compatible spaced repetition app, vocab-focused"
  homepage "https://github.com/iQeda/memorize"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "memorize.app"

  # Unsigned binary — strip the quarantine xattr so first launch doesn't
  # require a manual right-click → Open through Gatekeeper.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/memorize.app"],
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
