require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  head "https://github.com/thoughtbot/parity.git"
  sha256 "887750880c1b290c667216d8e2a6cbed09fc5a4f7278ae2574a3f7e29fa16ba5"
  url "https://github.com/thoughtbot/parity/archive/2.4.0.tar.gz"
  version "2.4.0"

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
