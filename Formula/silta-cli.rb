class SiltaCli < Formula
  desc "CI/CD deployment command abstraction, utilities and tools for Silta"
  homepage "https://github.com/wunderio/silta-cli"
  url "https://github.com/wunderio/silta-cli/archive/refs/tags/1.6.3.tar.gz"
  sha256 "6af2a9c53ddb845e29aa4671f3b7b3010d7360a4dae01568a9ffd54a0dd563d9"

  depends_on "go" => :build

  def install
    system "go", "mod", "download"
    system "go", "build", "-a", *std_go_args(output: "#{bin}/silta", ldflags: "-X github.com/wunderio/silta-cli/internal/common.Version=#{version}")
    generate_completions_from_executable("#{bin}/silta", "completion")
  end

  def caveats
    <<~EOS
      silta-cli been installed as "silta".
    EOS
  end

  test do
    version_output = shell_output("#{bin}/silta version 2>&1")
    assert_match(@version.to_s, version_output)
  end
end
