class Aps < Formula
  desc "Interactive session picker for Claude Code and Opencode"
  homepage "https://github.com/gadflysu/aps"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v\#{version}/aps_darwin_arm64.tar.gz"
      sha256 "691125f829a2d36cb297d0c01ec014d74599d50f30572d2bde48e1c5633d6bea"
    else
      url "https://github.com/gadflysu/aps/releases/download/v\#{version}/aps_darwin_amd64.tar.gz"
      sha256 "fc7ddc4b6667e7fcf6e4a0e6fdc13fe030ab6f0d8e8aaecdd7bcd69ab4ba7a22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v\#{version}/aps_linux_arm64.tar.gz"
      sha256 "216ad646d3a8e72e75a6930a709033dd6f0a0a6b73a8b873f1be815ab1824f24"
    else
      url "https://github.com/gadflysu/aps/releases/download/v\#{version}/aps_linux_amd64.tar.gz"
      sha256 "6928d2f9b3fbb68ab07a2ed17782127c6b0245641fb5863720daa28b9fd7ea5e"
    end
  end

  def install
    bin.install "aps"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "\#{bin}/aps"
  end

  test do
    assert_match "aps", shell_output("\#{bin}/aps -V")
  end
end
