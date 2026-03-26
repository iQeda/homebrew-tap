cask "mydashboard" do
  version "0.5.0"
  sha256 "321344fe00d5d77ffdd341848abb1ef5765656adf7bf49a7b8f816b2cd32b7cf"

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
