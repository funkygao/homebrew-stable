class Federate < Formula
  desc "A tool for merging and deploying microservices"
  homepage "https://github.com/funkygao/federate"
  url "https://github.com/funkygao/federate/archive/refs/tags/v2.4.3.tar.gz"
  sha256 "5369e6ee46f98d60074da31941330173795b79753d1dca456485b7996046fdf5"

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
