class Libxcproj < Formula
  desc "Library for manipulating Xcode project files"
  homepage "https://github.com/thoughtbot/libxproj"
  url "https://github.com/thoughtbot/libxcproj/archive/0.0.1.tar.gz"
  sha256 "83d6ea9dc98b9421e4e4453fa05aeddf7ab7108a78b8a6c8cc7a711027f36d49"

  def install
    xcodebuild "-target", "libxcproj", "install", "DSTROOT=#{prefix}", "SYMROOT=build"
  end

  test do
    (testpath/"test.m").write <<-EOS.undent
      #import <xcproj/Xcproj.h>

      int main(void) {
        [Xcproj loadFrameworks:NULL];
        id<PBXProject> project = [PBXProject new];
        NSLog(@"%@", project);
        return 0;
      }
    EOS
    system ENV.cc, "-lxcproj", "test.m"
    system "./a.out"
  end
end
