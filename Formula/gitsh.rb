require 'formula'

class Gitsh < Formula
  homepage 'http://thoughtbot.github.io/gitsh/'
  url 'http://thoughtbot.github.io/gitsh/gitsh-0.1.tar.gz'
  sha1 '42d4fb2e4f0db4d54fdc47a61bfdfbcf4294682d'

  system_ruby_version = `ruby -e "puts RUBY_VERSION"`.chomp
  if system_ruby_version < '2.0.0'
    depends_on 'Ruby'
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/gitsh", "--version"
  end
end
