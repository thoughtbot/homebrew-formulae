require "formula"

class Hound < Formula
  homepage "https://github.com/thoughtbot/hound-cli"
  url "https://github.com/thoughtbot/hound-cli/archive/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "88486a5151be3c0be0515111781b7be5a2f4621e38b1d211d0c3671ad78f7e34"

  def install
    prefix.install "lib" => "lib"
    bin.install "bin/hound"
  end

  def test
    system "hound"
  end
end
