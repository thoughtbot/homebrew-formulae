require "formula"

class Pick < Formula
  homepage "http://thoughtbot.github.io/pick/"
  url "https://github.com/thoughtbot/pick/releases/download/v1.3.0/pick-1.3.0.tar.gz"
  sha1 "87f7d24ad859bc059f5c5a9bb41f4697e4979bd8"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/pick", "-v"
  end
end
