require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  url "https://github.com/thoughtbot/parity/releases/download/v0.7.0/parity-0.7.0-osx.tar.gz"
  version "0.7.0"
  sha256 "3c9b9bf2a950c7a18e67800bdd6676cb415dd17a3acb4189a85184804d403f33"

  depends_on "git"
  depends_on "heroku-toolbelt"
  depends_on "postgres"

  def install
    prefix.install "lib" => "lib"

    bin.install "bin/development", "bin/staging", "bin/production"
  end

  test do
    system "#{bin}/development", "--version"
    system "#{bin}/staging", "--version"
    system "#{bin}/production", "--version"
  end
end
