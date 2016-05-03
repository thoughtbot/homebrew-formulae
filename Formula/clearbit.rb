require "language/go"

class Clearbit < Formula
  desc "Command-line interface to the Clearbit API"
  homepage "https://github.com/thoughtbot/clearbit"
  url "https://github.com/thoughtbot/clearbit/archive/v0.1.1.tar.gz"
  sha256 "50333b29690c7fe51171f189d80ac5b0f1c6a94d6a10fce4e7799524f3749e4a"

  depends_on "go" => :build

  go_resource "github.com/codegangsta/cli" do
    url "https://github.com/codegangsta/cli.git",
      :revision => "839f07bfe4819fa1434fa907d0804ce6ec45a5df"
  end

  def install
    ENV["GOPATH"] = buildpath

    # set up clearbit package
    (buildpath/"src/github.com/thoughtbot/clearbit").install Dir["*"]

    # set up dependencies
    Language::Go.stage_deps resources, buildpath/"src"

    # install clearbit command
    system(
      "go",
      "build",
      "-o", bin/"clearbit",
      "-v",
      "github.com/thoughtbot/clearbit/cmd/clearbit",
    )
  end
end
