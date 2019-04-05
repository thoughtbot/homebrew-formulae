require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  head "https://github.com/thoughtbot/parity.git"
  sha256 "fb4d72e7d84d7849c25589bf718580b46117f992f2b8b9d22a208bfad6d60a19"
  url "https://github.com/thoughtbot/parity/archive/v3.2.0.tar.gz"

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
