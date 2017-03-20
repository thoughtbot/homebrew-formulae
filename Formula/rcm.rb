class Rcm < Formula
  desc "management suite for dotfiles"
  homepage "https://thoughtbot.github.io/rcm"
  url "https://thoughtbot.github.io/rcm/dist/rcm-1.3.1.tar.gz"
  sha256 "9c8f92dba63ab9cb8a6b3d0ccf7ed8edf3f0fb388b044584d74778145fae7f8f"

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install", "install-man"
  end

  test do
    system "#{bin}/lsrc"
  end
end
