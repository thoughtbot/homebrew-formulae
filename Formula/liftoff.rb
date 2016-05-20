require 'formula'

class Liftoff < Formula
  homepage 'https://github.com/thoughtbot/liftoff'
  url 'http://thoughtbot.github.io/liftoff/Liftoff-1.8.0.tar.gz'
  sha1 '6d0d427239c0d5446c89cdc7caaf325b98a97818'

  depends_on 'xcproj' => :recommended

  def install
    prefix.install 'defaults', 'templates', 'vendor'
    prefix.install 'lib' => 'rubylib'

    man1.install ['man/liftoff.1']
    man5.install ['man/liftoffrc.5']

    bin.install 'src/liftoff'
  end

  test do
    system "#{bin}/liftoff", '--version'
  end
end
