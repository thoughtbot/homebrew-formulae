require "formula"

class Pick < Formula
  homepage "http://thoughtbot.github.io/pick/"
  url "https://github.com/thoughtbot/pick/releases/download/v1.1.0/pick-1.1.0.tar.gz"
  sha1 "cec167acc776065c055ab13a918d4e0300dca2f8"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/pick", "-v"
  end
end
