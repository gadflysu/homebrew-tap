class Aps < Formula
  desc "Interactive session picker for Claude Code and Opencode"
  homepage "https://github.com/gadflysu/aps"
  version "0.3.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_arm64.tar.gz"
      sha256 "177ba399db1df8e41d0a22dbaa30f54eff1a1241ab83e506bb9058f83bafa12a"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_amd64.tar.gz"
      sha256 "dfa3b388051e07a4ceaf904e09e32829f469ad0d87fffd8fec34f35ddf87ed4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_arm64.tar.gz"
      sha256 "bf600effa1051c033bf0d5590014966b53ac424a9f6b0336da8b2cc8b4f25cd6"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_amd64.tar.gz"
      sha256 "adfdfa436300a79fe802302e85b15253a69b31fbbb04bfdef7824ed2edf08e36"
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
