class Aps < Formula
  desc "Interactive session picker for Claude Code and Opencode"
  homepage "https://github.com/gadflysu/aps"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_arm64.tar.gz"
      sha256 "a942f211a976ba8dc360347439b9d7f7322e416229779f6673203f96c8a77752"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_amd64.tar.gz"
      sha256 "bcf41b63ae7c5e6b1c6d94197706498fe0c1afeb2b8bd8ca601dfad568d26bed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_arm64.tar.gz"
      sha256 "58e71da686d1c32f41c051013d294f4c3d144772dd63171b5d271bd6ed2d95f6"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_amd64.tar.gz"
      sha256 "5c00a6ae999a36f5c97c2f428ef4f2b3383f426e9c19b997dc77dd5579ff741b"
    end
  end

  head "https://github.com/gadflysu/aps.git", branch: "master"

  depends_on "go" => :build

  def install
    if build.head?
      system "go", "build", "-o", "#{bin}/aps", "."
    else
      bin.install "aps"
      system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{bin}/aps"
    end
  end

  test do
    assert_match "aps", shell_output("#{bin}/aps -V")
  end
end
