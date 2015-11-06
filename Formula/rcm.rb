class Rcm < Formula
  desc "management suite for dotfiles"
  homepage "https://thoughtbot.github.io/rcm"
  url "https://thoughtbot.github.io/rcm/dist/rcm-1.3.0.tar.gz"
  sha1 "10a04bf8a299f7a4991006e65a7d8fb95615565b"

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "lsrc"
  end
end
