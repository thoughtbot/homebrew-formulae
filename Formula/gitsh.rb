require 'formula'

class Gitsh < Formula
  homepage 'http://thoughtbot.github.io/gitsh/'
  url 'http://thoughtbot.github.io/gitsh/gitsh-0.3.tar.gz'
  sha1 '7f3a4e41f8bf20da3c6e7f7309dd1cba902be957'

  system_ruby_version = `/usr/bin/ruby -e "puts RUBY_VERSION"`.chomp
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
