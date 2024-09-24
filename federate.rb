class Federate < Formula
  desc "A tool for merging and deploying microservices"
  homepage "https://github.com/funkygao/federate"
  url "https://github.com/funkygao/federate/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "2af14d0155b26d35e42385e3b1b7153bd0b03bf0707823a288ea88d3c5cfb8cd"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/funkygao/federate"
    path.install Dir["*"]
    cd path do
      system "make", "install"
    end
    bin.install Dir["bin/*"]
  end

  test do
    system "#{bin}/federate", "version"
  end

end
