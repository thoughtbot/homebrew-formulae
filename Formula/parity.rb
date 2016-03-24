require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  sha256 "d56827ce379958b5abe386f6afff3b012275f43a6d982f524c54bb8a790cee20"
  url "https://github.com/thoughtbot/parity/releases/download/v0.9.2/parity-0.9.1-osx.tar.gz"
  version "0.9.2"

  depends_on "git"
  depends_on "heroku-toolbelt"
  depends_on "postgres"

  def install
    prefix.install "lib" => "lib"

    bin.install "bin/development", "bin/staging", "bin/production"
  end

  devel do
    url "https://github.com/thoughtbot/parity/releases/download/v0.9.3.beta/parity-0.9.3.beta-osx.tar.gz"

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
