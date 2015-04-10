require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  url "https://github.com/thoughtbot/parity/releases/download/v0.6.0/parity-0.6.0-osx.tar.gz"
  version "0.6.0"
  sha256 "e2983aa4057c9f72fed390abe73fda223a76352b3648391b2d4f1df652d2e4ec"

  depends_on "heroku-toolbelt"

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
