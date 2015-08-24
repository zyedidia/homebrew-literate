class Literate < Formula
  desc "A Modern Literate Programming System"
  homepage "http://literate.zbyedidia.webfactional.com"
  url "http://literate.zbyedidia.webfactional.com/versions/literate.1.0.0.tar.gz"
  sha256 "c1972dd011972a993b948b93f1c2aa68c0beb1c169633f6e332e5bff0b6d833d"

  depends_on "lua"
  # Better to use universal ctags
  depends_on "ctags-exuberant" => :optional

  def install
      prefix.install Dir["bin"]
  end
end
