class SiltaCli < Formula
  desc "CI/CD deployment command abstraction, utilities and tools for Silta."
  homepage "https://github.com/wunderio/silta-cli"
  url "https://github.com/wunderio/silta-cli/archive/refs/tags/0.1.24.tar.gz"
  sha256 "501d5743e6285f6c887f62e5a0bcbfdd1e1431dfa2dce16ceeebbad0f9d02f8c"
  license ""
  version "0.1.24"

   depends_on "go" => :build

  def install
    system "go", "mod", "download"
    system "go", "build", "-a", *std_go_args(output: "#{bin}/silta")
  end
  
    def caveats
      <<~EOS
        silta-cli been installed as "silta".
      EOS
    end

  test do
    system "false"
  end
end
