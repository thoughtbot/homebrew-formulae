require "formula"

class Parity < Formula
  homepage "https://github.com/thoughtbot/parity"
  url "https://github.com/thoughtbot/parity/releases/download/v0.8.0/parity-0.8.0-osx.tar.gz"
  version "0.8.0"
  sha256 "c98bc7cc601a2b2be7bdcc16f0e470c9e2b59673005b56c6e6e83152a17ab916"

  depends_on "git"
  depends_on "heroku-toolbelt"
  depends_on "postgres"

  def install
    prefix.install "lib" => "lib"

    bin.install "bin/development", "bin/staging", "bin/production"
  end

  test do
    system "#{bin}/development", "--version"
    system "#{bin}/staging", "--version"
    system "#{bin}/production", "--version"
  end
end
