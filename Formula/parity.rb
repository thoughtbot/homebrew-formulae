require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  sha256 "ddb5ffe7e4548c77cfe9627c6b1eed6305ff064b551f5203750a9f31406b3bc5"
  url "https://github.com/thoughtbot/parity/releases/download/v2.0.0/parity-2.0.0-osx.tar.gz"
  version "2.0.0"

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
