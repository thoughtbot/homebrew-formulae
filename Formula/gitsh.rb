require 'formula'

class Gitsh < Formula
  homepage 'http://thoughtbot.github.io/gitsh/'
  url 'http://thoughtbot.github.io/gitsh/gitsh-0.2.tar.gz'
  sha1 '5618056dcf1b9a496a47ca6016f07086fb605a2b'

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
