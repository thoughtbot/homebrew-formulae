require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  url "https://github.com/thoughtbot/parity/releases/download/v0.9.1/parity-0.9.1-osx.tar.gz"
  version "0.9.1"
  sha256 "da0de0d6cc3990fd14e990753ad193221ee3a2ee61f8dd8b537aae54c1e9f141"

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
