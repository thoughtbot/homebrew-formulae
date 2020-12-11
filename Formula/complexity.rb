class Complexity < Formula
  desc "Identify complex code"
  homepage "https://github.com/thoughtbot/complexity"
  url "https://github.com/thoughtbot/complexity/archive/0.2.0.tar.gz"
  sha256 "47e53e0d4705683bfb596038478ce08c361a4c590253514468376148db981300"
  license "MIT"

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
