require "formula"

class Ruby19Dependency < Requirement
  fatal true

  satisfy do
    `ruby --version` =~ /ruby (\d\.\d).\d/
    $1.to_f >= 1.9
  end

  def message
    "Suspenders requires Ruby 1.9 or better."
  end
end

class Suspenders < Formula
  homepage "https://github.com/thoughtbot/suspenders"
  url "https://github.com/thoughtbot/suspenders/archive/v1.14.0.tar.gz"
  sha1 "0e5d6a51f6df9f80d174e96977ddf2eb5f0c8d04"

  depends_on Ruby19Dependency

  def install
    bin.install "suspenders"
  end

  test do
    system "#{bin}/suspenders", "--version"
  end
end
