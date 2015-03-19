require "formula"

class Parity < Formula
  homepage "https://github.com/croaky/parity"
  url "https://github.com/croaky/parity/releases/download/v0.5.1/parity-0.5.1-osx.tar.gz"
  version "0.5.1"
  sha256 "929bd4a774f80e25ed68fd232ce473f28f41ea00e604e6e57f7ac02c4eff0998"

  depends_on "heroku-toolbelt"

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
