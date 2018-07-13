class Rcm < Formula
  desc "management suite for dotfiles"
  homepage "https://thoughtbot.github.io/rcm"
  url "https://thoughtbot.github.io/rcm/dist/rcm-1.3.3.tar.gz"
  sha256 "935524456f2291afa36ef815e68f1ab4a37a4ed6f0f144b7de7fb270733e13af"

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/lsrc"
  end
end
