require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  head "https://github.com/thoughtbot/parity.git"
  sha256 "600e81753d6b5b765371fe135883bfdb92812e0dfd7cb6eb8078ab7439389617 "
  url "https://github.com/thoughtbot/parity/archive/v3.0.0.tar.gz"
  version "3.0.0"

  depends_on "git"
  depends_on "heroku-toolbelt" => :recommended
  depends_on "postgres" => :recommended

  def install
    lib.install Dir["lib/*"]

    bin.install "bin/development", "bin/staging", "bin/production"
  end

  devel do
    url "https://github.com/thoughtbot/parity/releases/tag/development-20171006a"

    depends_on "git"
    depends_on "heroku-toolbelt" => :recommended
    depends_on "postgres" => :recommended
  end

  test do
    system "#{bin}/development", "--version"
    system "#{bin}/pr_app", "--version"
    system "#{bin}/production", "--version"
    system "#{bin}/staging", "--version"
  end
end
