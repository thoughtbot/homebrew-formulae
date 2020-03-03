class Parity < Formula
  desc "Shell commands for environment parity for Heroku apps"
  homepage "https://github.com/thoughtbot/parity"
  url "https://github.com/thoughtbot/parity/archive/3.3.0.tar.gz"
  sha256 "a0f22b73482cf3117d17b1176fe83f0ea510456ad0333e56339129059c25c845"
  head "https://github.com/thoughtbot/parity.git"

  devel do
    url "https://github.com/thoughtbot/parity/releases/tag/development-20171006a"
  end

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
