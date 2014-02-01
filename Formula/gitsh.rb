require 'formula'

class Gitsh < Formula
  SYSTEM_RUBY_PATH = '/usr/bin/ruby'

  homepage 'http://thoughtbot.github.io/gitsh/'
  url 'http://thoughtbot.github.io/gitsh/gitsh-0.3.tar.gz'
  sha1 '7f3a4e41f8bf20da3c6e7f7309dd1cba902be957'

  def self.old_system_ruby?
    system_ruby_version = `#{SYSTEM_RUBY_PATH} -e "puts RUBY_VERSION"`.chomp
    system_ruby_version < '2.0.0'
  end

  if old_system_ruby?
    depends_on 'Ruby'
  end

  def install
    set_ruby_path
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/gitsh", "--version"
  end

  private

  def set_ruby_path
    if self.class.old_system_ruby?
      ENV['RUBY'] = "#{HOMEBREW_PREFIX}/bin/ruby"
    else
      ENV['RUBY'] = SYSTEM_RUBY_PATH
    end
  end
end
