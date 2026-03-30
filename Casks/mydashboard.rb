cask "mydashboard" do
  version "0.10.0"
  sha256 "73d47585f13260d940221450528cd3d46b6044e3ee8a3d0c14de31866ed975c5"

  url "https://github.com/iQeda/my-dashboard-app/releases/download/v#{version}/MyDashboard.app.tar.gz"
  name "MyDashboard"
  desc "Mac app/site launcher dashboard"
  homepage "https://iqeda.github.io/my-dashboard-app/"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "MyDashboard.app"

  caveats <<~EOS
    This app is not signed with an Apple Developer ID.
    macOS Gatekeeper may block it on first launch.
    If needed, run: xattr -cr /Applications/MyDashboard.app
  EOS

  zap trash: [
    "~/Library/Mobile Documents/com~apple~CloudDocs/my-dashboard-app",
    "~/.config/my-dashboard-app",
  ]
end
