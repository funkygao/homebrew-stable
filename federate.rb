class Federate < Formula
  desc "A tool for merging and deploying microservices"
  homepage "https://github.com/funkygao/federate"
  url "https://github.com/funkygao/federate/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "a951ac700c1acb5fb825678acb135c6bf645c146c51c36f67770a6fa5b0fee94"

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
