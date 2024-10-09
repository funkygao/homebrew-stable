class Federate < Formula
  desc "A tool for merging and deploying microservices"
  homepage "https://github.com/funkygao/federate"
  url "https://github.com/funkygao/federate/archive/refs/tags/v2.0.5.tar.gz"
  sha256 "41f0ea385a4e04aa920dfdb13c2e3a24b46c37719de80581a838cfc1c11ec6d8"

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
