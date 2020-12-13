class Complexity < Formula
  desc "Identify complex code"
  homepage "https://github.com/thoughtbot/complexity"
  url "https://github.com/thoughtbot/complexity/archive/0.3.0.tar.gz"
  sha256 "d46d060cc6981fd3071064eb9b493466bea4a152ed1c9bfed4f7afc1677327da"
  license "MIT"
  head "https://github.com/thoughtbot/complexity.git"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    code = testpath/"awesome.rb"
    code.write <<~EOS
      class Awesome
        def once
          twice
        end

        def twice
          @twice || 2
        end
      end
    EOS

    output = shell_output("#{bin}/complexity")

    assert_match(/\s+\d+\.\d+awesome\.rb/, output)

    true
  end
end
