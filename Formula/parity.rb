require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  head "https://github.com/thoughtbot/parity.git"
  sha256 "c804bca89d99f8cfacde6098959a198b9ef347ad8ce40759133fd766206d7b04"
  url "https://github.com/thoughtbot/parity/archive/3.1.0.tar.gz"

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
