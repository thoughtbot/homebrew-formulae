require 'formula'

class Liftoff < Formula
  homepage 'https://github.com/liftoffcli/liftoff'
  url 'http://liftoffcli.github.io/liftoff/Liftoff-1.8.1.tar.gz'
  sha256 '4f60770640cef4d510fccb66fb36e7418487f013070d2a7fcce3b450638c1566'

  depends_on 'xcproj' => :recommended

  def install
    opoo 'This tap for Liftoff has been deprecated and will no longer be updated! Please move to the new tap at liftoffcli/formula as soon as possible.'
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
