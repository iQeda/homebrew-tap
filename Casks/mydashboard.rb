cask "mydashboard" do
  version "0.10.1"
  sha256 "eb74328e62bee3fc4a9a4dca3d2fd7aebc1c119a1cd6f9d68b412ce44d066019"

  url "https://github.com/iQeda/my-dashboard-app/releases/download/v#{version}/MyDashboard.app.tar.gz"
  name "MyDashboard"
  desc "Mac app/site launcher dashboard"
  homepage "https://github.com/iQeda/my-dashboard-app"

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
