require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  url "https://github.com/thoughtbot/parity/releases/download/v0.9.2/parity-0.9.2-osx.tar.gz"
  version "0.9.2"
  sha256 "d56827ce379958b5abe386f6afff3b012275f43a6d982f524c54bb8a790cee20"

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
