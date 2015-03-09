require "formula"

class Pick < Formula
  homepage "http://thoughtbot.github.io/pick/"
  url "https://github.com/thoughtbot/pick/releases/download/v1.1.1/pick-1.1.1.tar.gz"
  sha1 "6197e968c44e496fcce361936766e5d5150eaa49"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/pick", "-v"
  end
end
