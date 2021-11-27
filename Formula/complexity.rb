class Complexity < Formula
  desc "Identify complex code"
  homepage "https://github.com/thoughtbot/complexity"
  url "https://github.com/thoughtbot/complexity/archive/0.4.1.tar.gz"
  sha256 "3a9719d64379012ebf185cc914dbc9e76897f82c0fefc0d609370f351c812e93"
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
