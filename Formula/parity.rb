class Parity < Formula
  desc "Shell commands for environment parity for Heroku apps"
  homepage "https://github.com/thoughtbot/parity"
  url "https://github.com/thoughtbot/parity/archive/3.4.0.tar.gz"
  sha256 "bea956bfbe45f681fea3310aa176979734a7ce4a4c5d9ba9ddc644a1df0ca596"
  head "https://github.com/thoughtbot/parity.git"

  depends_on "heroku/brew/heroku" => :recommended
  depends_on "postgresql" => :recommended

  def install
    lib.install Dir["lib/*"]

    bin.install "bin/development", "bin/staging", "bin/production", "bin/pr_app"
  end

  test do
    system "#{bin}/development", "--version"
    system "#{bin}/pr_app", "--version"
    system "#{bin}/production", "--version"
    system "#{bin}/staging", "--version"
  end
end
