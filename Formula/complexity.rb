class Complexity < Formula
  desc "Identify complex code"
  homepage "https://github.com/thoughtbot/complexity"
  url "https://github.com/thoughtbot/complexity/archive/0.4.2.tar.gz"
  sha256 "735eec89e28fb2dcb8f55c3b3fe3ff39044986eb309b21aa404fdd87d2be91ab"
  license "MIT"
  head "https://github.com/thoughtbot/complexity.git"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  option "without-mimalloc", "Use Rust's default allocator (may reduce performance)"

  def install
    if build.with? "mimalloc"
      system "cargo", "install", "--locked", "--root", prefix, "--path", ".", "--features", "mimalloc"
    else
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
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
