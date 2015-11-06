require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  url "https://github.com/thoughtbot/parity/releases/download/v0.9.0/parity-0.9.0-osx.tar.gz"
  version "0.9.0"
  sha256 "d517bc7a1f378e1fdb7203a16ac85c1013a32d5d44e5810321623f651fa09c0a"

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
