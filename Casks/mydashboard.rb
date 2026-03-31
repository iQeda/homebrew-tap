cask "mydashboard" do
  version "0.12.0"
  sha256 "6ceeff608dce1a489e86d004ba73009c87e4562e6e51ab1312f1bb5c8d519751"

  url "https://github.com/iQeda/my-dashboard-app/releases/download/v#{version}/MyDashboard.app.tar.gz"
  name "MyDashboard"
  desc "Mac app/site launcher dashboard"
  homepage "https://github.com/iQeda/my-dashboard-app"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "MyDashboard.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MyDashboard.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Mobile Documents/com~apple~CloudDocs/my-dashboard-app",
    "~/.config/my-dashboard-app",
  ]
end
