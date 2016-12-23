require 'formula'

class Gitsh < Formula
  SYSTEM_RUBY_PATH = '/usr/bin/ruby'
  HOMEBREW_RUBY_PATH = "#{HOMEBREW_PREFIX}/bin/ruby"

  env :std
  homepage 'https://github.com/thoughtbot/gitsh/'
  url 'http://thoughtbot.github.io/gitsh/gitsh-0.11.tar.gz'
  sha256 '9a2323b7677c4f8f496e3a62913c219654703370ce96efbdb4f12c3192f6218e'

  def self.old_system_ruby?
    system_ruby_version = `#{SYSTEM_RUBY_PATH} -e "puts RUBY_VERSION"`.chomp
    system_ruby_version < '2.0.0'
  end

  if old_system_ruby?
    depends_on 'Ruby'
  end
  depends_on 'readline'

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
    if self.class.old_system_ruby? || File.exist?(HOMEBREW_RUBY_PATH)
      ENV['RUBY'] = HOMEBREW_RUBY_PATH
    else
      ENV['RUBY'] = SYSTEM_RUBY_PATH
    end
  end
end
