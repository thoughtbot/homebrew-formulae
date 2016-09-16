require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  sha256 "822292a9a2ccb05c592d4da311820e1252ba7363b9f78b7ba0c75469df508460"
  url "https://github.com/thoughtbot/parity/releases/download/v1.0.0/parity-1.0.0-osx.tar.gz"
  version "1.0.0"

  depends_on "git"
  depends_on "heroku-toolbelt"
  depends_on "postgres"

  def install
    lib.install Dir["lib/*"]

    bin.install "bin/development", "bin/staging", "bin/production"
  end

  devel do
    url "https://github.com/thoughtbot/parity/releases/download/development/parity-development.tar.gz"

    depends_on "git"
    depends_on "heroku-toolbelt"
    depends_on "postgres"
  end

  test do
    system "#{bin}/development", "--version"
    system "#{bin}/production", "--version"
    system "#{bin}/staging", "--version"
  end
end
