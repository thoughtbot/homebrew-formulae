class Rcm < Formula
  desc "management suite for dotfiles"
  homepage "https://thoughtbot.github.io/rcm"
  url "https://thoughtbot.github.io/rcm/dist/rcm-1.3.2.tar.gz"
  sha256 "2f31b49c241ed6e74578fc71e6b2ba3a87183d311f28e05b9f7cc7c1c55dda64"

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/lsrc"
  end
end
