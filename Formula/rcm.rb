require 'formula'

class Rcm < Formula
  homepage 'http://thoughtbot.github.io/rcm'
  url 'http://thoughtbot.github.io/rcm/dist/rcm-1.2.1.tar.gz'
  sha1 '434bdfbb1df8e610586cd9042a1e2ac614290ca7'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "lsrc"
  end
end
