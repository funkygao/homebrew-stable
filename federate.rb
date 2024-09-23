class Federate < Formula
  desc "A tool for merging and deploying microservices"
  homepage "https://github.com/funkygao/federate"
  url "https://github.com/funkygao/federate/archive/refs/tags/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "8aace2457ec4ffa4f516ec827ea638298a7c953de05fd8a578822fa9209bb191"

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make", "install"
    bin.install "federate"
  end

  test do
    system "#{bin}/federate", "version"
  end

end
