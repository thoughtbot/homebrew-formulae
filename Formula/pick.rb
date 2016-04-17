require "formula"

class Pick < Formula
  homepage "http://thoughtbot.github.io/pick/"
  url "https://github.com/thoughtbot/pick/releases/download/v1.3.0/pick-1.3.0.tar.gz"
  sha256 "a1c2c7902f6a322d7be5cf024d6cb94f1e65edfbba4b151647d215481f783257"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/pick", "-v"
  end
end
