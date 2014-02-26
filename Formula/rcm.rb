require 'formula'

class Rcm < Formula
  homepage 'http://thoughtbot.github.io/rcm'
  url 'https://github.com/thoughtbot/rcm/archive/v1.2.0.tar.gz'
  sha1 'b512a2f3d4d81e726e685c4807c4167c232fb09c'
  head 'https://github.com/thoughtbot/rcm.git'

  depends_on "autoconf"
  depends_on "automake"

  def install
    system "aclocal"
    system "automake --add-missing --copy"
    system "autoconf"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "lsrc"
  end
end
