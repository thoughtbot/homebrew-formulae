require 'formula'

class Rcm < Formula
  homepage 'http://thoughtbot.github.io/rcm'
  url 'http://thoughtbot.github.io/rcm/dist/rcm-1.2.3.tar.gz'
  sha1 'f89e64f45d714567f54474b3b4cc825b130ab114'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "lsrc"
  end
end
