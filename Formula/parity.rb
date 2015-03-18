require "formula"

class Parity < Formula
  homepage "https://github.com/croaky/parity"
  url "https://github.com/croaky/parity/releases/download/v0.5.0/parity-0.5.0-osx.tar.gz"
  version "0.5.0"
  sha256 "626df68d2d2c07d699b3ab63ef6ba91a4ea2d35dd672e2cca217a6e13fe9fbcc"

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
