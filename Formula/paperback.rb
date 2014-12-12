require "formula"

class Paperback < Formula
  homepage ""
  version "0.1"

  if Hardware.is_64_bit?
    url "https://s3.amazonaws.com/homebrew-formulae/go-paperback_v0.1_darwin_amd64.tar.gz"
    sha256 "5a65ee4919cb927b2bcecf3271163c753c7b6cd16f2df86cd387005b79e0b257"
  end

  depends_on :arch => :intel

  def install
    bin.install Dir["*"]
  end
end
