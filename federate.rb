class Federate < Formula
  desc "A tool for merging and deploying microservices"
  homepage "https://github.com/funkygao/federate"
  url "https://github.com/funkygao/federate/archive/refs/tags/v2.0.4.tar.gz"
  sha256 "8e544b4053f030dca0c3df3bcf2b18f9fe694ddbceaab986101c58fc1d9b0276"

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
