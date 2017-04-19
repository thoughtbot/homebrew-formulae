require 'formula'

class Gitsh < Formula
  SYSTEM_RUBY_PATH = '/usr/bin/ruby'
  HOMEBREW_RUBY_PATH = "#{HOMEBREW_PREFIX}/bin/ruby"

  env :std
  homepage 'https://github.com/thoughtbot/gitsh/'
  url 'http://thoughtbot.github.io/gitsh/gitsh-0.11.2.tar.gz'
  sha256 'e8d4f65b23a0d9c134d7fc61105f439ff70e6350c4945045959dbd851985d8f5'

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
    set_architecture
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

  def set_architecture
    ENV['READLINE_ARCH'] = "-arch #{MacOS.preferred_arch}"
  end
end
