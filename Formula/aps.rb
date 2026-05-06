class Aps < Formula
  desc "Interactive session picker for Claude Code and Opencode"
  homepage "https://github.com/gadflysu/aps"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_arm64.tar.gz"
      sha256 "7f880d1e8b0f7aea3fdb00bd47583f6c5763247f4c9fab737bd27254a2bdb410"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_amd64.tar.gz"
      sha256 "567916d139704a937f07cd3f229924bdf24f31d6fb52d7040feff3b26e72d4d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_arm64.tar.gz"
      sha256 "604dbb0087fdafd5e913a986900526561721a8b44d35ebf2cd9292185458567f"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_amd64.tar.gz"
      sha256 "5e9c90e4d871cc60d977e8f5c1d2f9e0b21793c81b2905a1de1f12a154002d39"
    end
  end

  def install
    bin.install "aps"
  end

  def post_install
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{bin}/aps"
  end

  test do
    assert_match "aps", shell_output("#{bin}/aps --version")
  end
end
