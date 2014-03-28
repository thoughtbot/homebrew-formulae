require 'formula'

class Rcm < Formula
  homepage 'http://thoughtbot.github.io/rcm'
  url 'http://thoughtbot.github.io/rcm/dist/rcm-1.2.2.tar.gz'
  sha1 '844f4325e1eadeb2cf838629e5533b8d7450d0d9'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "lsrc"
  end
end
