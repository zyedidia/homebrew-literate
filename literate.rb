class Literate < Formula
  desc "A Modern Literate Programming System"
  homepage "http://literate.zbyedidia.webfactional.com"
  url "http://literate.zbyedidia.webfactional.com/versions/literate.1.0.0.tar.gz"
  sha256 "c1972dd011972a993b948b93f1c2aa68c0beb1c169633f6e332e5bff0b6d833d"

  head "https://github.com/zyedidia/Literate.git"

  depends_on "lua"
  # Better to use universal ctags
  depends_on "ctags-exuberant" => :optional

  def install
    bin.install Dir["bin/lit"]
  end

  test do
    (testpath/"test.lit").write <<-EOS.undent
      @title Hello World

      @s Introduction
      This is a simple `Hello World` program written in C.

      --- hello_world.c
      #include <stdio.h>

      int main() {
          printf("Hello world");

          return 0;
      }
      ---
      EOS

      (testpath/"ans.c").write <<-EOS.undent
        #include <stdio.h>

        int main() {
            printf("Hello world");

            return 0;
        }
      EOS

      system "#{bin}/lit", "-code", "#{testpath/"test.lit"}"
      assert_match File.read("hello_world.c").strip, File.read("ans.c").strip
  end
end
