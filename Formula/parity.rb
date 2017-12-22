require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  head "https://github.com/thoughtbot/parity.git"
  sha256 "5a1541b12c762b3f2597bce41f7641fe6c32d80cccec57d3bdcd4f9c856fea3d"
  url "https://github.com/thoughtbot/parity/archive/v2.3.0.tar.gz"
  version "2.3.0"

  depends_on "git"
  depends_on "heroku-toolbelt"
  depends_on "postgres" => :optional

  def install
    lib.install Dir["lib/*"]

    bin.install "bin/development", "bin/staging", "bin/production"
  end

  devel do
    url "https://github.com/thoughtbot/parity/releases/download/development/parity-development.tar.gz"

    depends_on "git"
    depends_on "heroku-toolbelt"
    depends_on "postgres" => :recommended
  end

  test do
    system "#{bin}/development", "--version"
    system "#{bin}/production", "--version"
    system "#{bin}/staging", "--version"
  end
end
