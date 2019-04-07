require 'formula'

class Gitsh < Formula
  SYSTEM_RUBY_PATH = '/usr/bin/ruby'
  HOMEBREW_RUBY_PATH = "#{HOMEBREW_PREFIX}/bin/ruby"

  env :std
  homepage 'https://github.com/thoughtbot/gitsh/'
  url 'https://thoughtbot.github.io/gitsh/gitsh-0.14.tar.gz'
  head 'https://github.com/thoughtbot/gitsh.git'
  sha256 '4b89b6d006326a7b57c4c8e440594e477db61b7d3fe2633a8aad176bb19d0125'

  def self.old_system_ruby?
    system_ruby_version = `#{SYSTEM_RUBY_PATH} -e "puts RUBY_VERSION"`.chomp
    system_ruby_version < '2.3.0'
  end

  if old_system_ruby?
    depends_on 'Ruby'
  end
  depends_on 'readline'

  def install
    set_ruby_path
    set_architecture

    if build.head?
      system './autogen.sh'
      system 'RUBY="$(which ruby)" ./configure'
      system 'make release_build_tarball'
      system 'tar -xzvf gitsh-0.14.tar.gz'
      chdir 'gitsh-0.14'
    end

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
