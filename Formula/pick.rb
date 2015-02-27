require "formula"

class Pick < Formula
  homepage "http://thoughtbot.github.io/pick/"
  url "https://github.com/thoughtbot/pick/releases/download/v1.1.0/pick-1.1.0.tar.gz"
  sha1 "8b035e64cc5faea407e73cce01ca039e3ce3b4ac"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/pick", "-v"
  end
end
