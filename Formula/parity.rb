require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  head "https://github.com/thoughtbot/parity.git"
  sha256 "2f4b600b4d8d88507c632e8b994d3827a3c5ff577b3f997c0e57d81229fe22e7"
  url "https://github.com/thoughtbot/parity/archive/3.0.1.tar.gz"

  depends_on "git"
  depends_on "heroku/brew/heroku" => :recommended
  depends_on "postgres" => :recommended

  def install
    lib.install Dir["lib/*"]

    bin.install "bin/development", "bin/staging", "bin/production", "bin/pr_app"
  end

  devel do
    url "https://github.com/thoughtbot/parity/releases/tag/development-20171006a"

    depends_on "git"
    depends_on "heroku/brew/heroku" => :recommended
    depends_on "postgres" => :recommended
  end

  test do
    system "#{bin}/development", "--version"
    system "#{bin}/pr_app", "--version"
    system "#{bin}/production", "--version"
    system "#{bin}/staging", "--version"
  end
end
