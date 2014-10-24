require "formula"

class Parity < Formula
  homepage "https://github.com/croaky/parity"
  url "https://github.com/croaky/parity/archive/v0.3.1.tar.gz"
  sha1 "f07b33958067d719a4487243cae10c5f6e1b379c"

  depends_on "heroku-toolbelt"

  def install
    # Add the lib/ directory to the Ruby load path at the top of the file
    inreplace "lib/parity.rb", /\A/, "$LOAD_PATH << File.dirname(__FILE__)\n\n"

    prefix.install "lib" => "lib"

    bin.install "bin/development", "bin/staging", "bin/production"
  end

  test do
    system "#{bin}/development", "--version"
    system "#{bin}/staging", "--version"
    system "#{bin}/production", "--version"
  end
end
