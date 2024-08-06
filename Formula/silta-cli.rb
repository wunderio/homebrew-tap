class SiltaCli < Formula
  desc "CI/CD deployment command abstraction, utilities and tools for Silta"
  homepage "https://github.com/wunderio/silta-cli"
  url "https://github.com/wunderio/silta-cli/archive/refs/tags/1.6.1.tar.gz"
  sha256 "1d867b29b433fc35a69c1a501f7fc9c8d8a75f9f8af77b9c86f5ddb0a0643f3d"

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
