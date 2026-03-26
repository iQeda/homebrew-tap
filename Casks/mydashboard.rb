cask "mydashboard" do
  version "0.6.0"
  sha256 "954a7d1845f85168df34b351a0623cba3c463f243b1c565c37964572bb7af17e"

  url "https://github.com/iQeda/my-dashboard-app/releases/download/v#{version}/MyDashboard.app.tar.gz"
  name "MyDashboard"
  desc "Mac app/site launcher dashboard"
  homepage "https://github.com/iQeda/my-dashboard-app"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "MyDashboard.app"

  zap trash: [
    "~/Library/Mobile Documents/com~apple~CloudDocs/my-dashboard-app",
    "~/.config/my-dashboard-app",
  ]
end
