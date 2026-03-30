cask "mydashboard" do
  version "0.11.1"
  sha256 "3f31b820f53807dc0c0c58fe2314c4d4a2eb5c71f436cd831be3b6db3d4f52e7"

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
