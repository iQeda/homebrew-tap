cask "mydashboard" do
  version "0.12.2"
  sha256 "13881c1c18c022e755541d42ce530c3f49f09ced2a2fe0ea12c3d8130a108836"

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
