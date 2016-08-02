require "formula"

class Paperback < Formula
  homepage ""
  version "0.1.1"

  if Hardware::CPU.is_64_bit?
    url "https://s3.amazonaws.com/homebrew-formulae/go-paperback_v0.1.1_darwin_amd64.tar.gz"
    sha256 "4d143ffc7333b5ec25d555ef99f69c0b8602b9a4f3104fcdaea34ffb35002aaf"
  end

  depends_on :arch => :intel

  def install
    bin.install Dir["*"]
  end
end
