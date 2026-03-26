cask "mydashboard" do
  version "0.1.0"
  sha256 "05e2f50740eef1cbf3aeecfd32bf0ae258ef66616b11e47456c3abee722aa81f"

  url "https://github.com/iQeda/my-dashboard-app/releases/download/v#{version}/MyDashboard-#{version}-aarch64.tar.gz"
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
