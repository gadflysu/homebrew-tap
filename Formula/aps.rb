class Aps < Formula
  desc "Interactive session picker for Claude Code and Opencode"
  homepage "https://github.com/gadflysu/aps"
  version "0.3.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_arm64.tar.gz"
      sha256 "31a51781a3598f1423e12bc4016c714a90e74928b5786f6a63e11f5f110adb49"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_amd64.tar.gz"
      sha256 "6fc7c617e33651270e84583af5504cd163ddf7fa5debf6151410f13c2d3d3d93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_arm64.tar.gz"
      sha256 "56297e5b7ed6f0ab01d3622c5b4876f5d0109f1180dde1755b48699b2c519c14"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_amd64.tar.gz"
      sha256 "cda83a1a4c00abdfc4abd0f25dad58883589e885aeafe8db532fdfdde47618f4"
    end
  end

  def install
    bin.install "aps"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{bin}/aps"
  end

  test do
    assert_match "aps", shell_output("#{bin}/aps -V")
  end
end
