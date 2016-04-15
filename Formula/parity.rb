require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  sha256 "438b15beb0f0e0fd8da1aee5cc47ca57ff03c138091100d30fe5ae90a0f22c22"
  url "https://github.com/thoughtbot/parity/releases/download/0.9.3/parity-0.9.3-osx.tar.gz"
  version "0.9.3"

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
