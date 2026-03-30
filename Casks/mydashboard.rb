cask "mydashboard" do
  version "0.11.0"
  sha256 "230669bededa0ae178024bca4bf2a7d81422b15c9112e7c8b02c49beec58c915"

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
