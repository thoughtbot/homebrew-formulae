require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  sha256 "693e2f05ba5eccca7a526be7ae0afc25dcddea6ad55cd998bc9b6935920920f0"
  url "https://github.com/thoughtbot/parity/releases/download/v2.0.1/parity-2.0.1-osx.tar.gz"
  version "2.0.1"

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
