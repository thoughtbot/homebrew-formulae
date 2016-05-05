class Rcm < Formula
  desc "management suite for dotfiles"
  homepage "https://thoughtbot.github.io/rcm"
  url "https://thoughtbot.github.io/rcm/dist/rcm-1.3.0.tar.gz"
  sha256 "ddcf638b367b0361d8e063c29fd573dbe1712d1b83e8d5b3a868e4aa45ffc847"

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "lsrc"
  end
end
