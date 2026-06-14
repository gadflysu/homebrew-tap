class Aps < Formula
  desc "Interactive session picker for Claude Code and Opencode"
  homepage "https://github.com/gadflysu/aps"
  version "0.3.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_arm64.tar.gz"
      sha256 "c2e22c1b0b3dd9ac873556d69a7f333e46303a5b35f9505681405bf2e8b650fb"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_amd64.tar.gz"
      sha256 "d68c79ef2bab12081fcc4c7ac4c6d62833b2a41bd982755b07f214fcface5f13"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_arm64.tar.gz"
      sha256 "e43c920831c892e5f30dd61f5286eac8b10c516dfbced22daac78b3e8c2c77f7"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_amd64.tar.gz"
      sha256 "ae952b7b04a7abaf3e1e2c26a4c811bfc99f010465214286335e79864393dbe2"
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
