require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  sha256 "8636c308f7dab8b0f6317f30bace4bcab3412ecf37a6051a710a8a4460391385"
  url "https://github.com/thoughtbot/parity/releases/download/0.10.0/parity-0.10.0-osx.tar.gz"
  version "0.10.0"

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
