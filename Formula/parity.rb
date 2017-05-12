require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  head "https://github.com/thoughtbot/parity.git"
  sha256 "e9381fd8ee3d8036d9843198584cdf742ee4470af26a19eba45eaeb5f4ec39eb"
  url "https://github.com/thoughtbot/parity/releases/download/v2.2.0/parity-2.2.0.tar.gz"
  version "2.2.0"

  depends_on "git"
  depends_on "heroku-toolbelt"
  depends_on "postgres" => :optional

  def install
    lib.install Dir["lib/*"]

    bin.install "bin/development", "bin/staging", "bin/production"
  end

  devel do
    url "https://github.com/thoughtbot/parity/releases/download/development/parity-development.tar.gz"

    depends_on "git"
    depends_on "heroku-toolbelt"
    depends_on "postgres" => :recommended
  end

  test do
    system "#{bin}/development", "--version"
    system "#{bin}/production", "--version"
    system "#{bin}/staging", "--version"
  end
end
