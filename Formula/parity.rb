require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  head "https://github.com/thoughtbot/parity.git"
  sha256 "90d80c4560d1b7f4bf569498afb3e752b5be69dce560e32c6cb53ba93352d3c7"
  url "https://github.com/thoughtbot/parity/archive/2.2.1.tar.gz"
  version "2.2.1"

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
