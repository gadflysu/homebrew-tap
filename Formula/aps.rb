class Aps < Formula
  desc "Interactive session picker for Claude Code and Opencode"
  homepage "https://github.com/gadflysu/aps"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_arm64.tar.gz"
      sha256 "3773f5444b06c084f73dad19c83fe92cc965b7654373c7e8f04bf3cd766dfa16"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_amd64.tar.gz"
      sha256 "630c64ab9367e46e2b69b460e08d31dbb932ada19a02f4379da5b08d394f0b0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_arm64.tar.gz"
      sha256 "2a0ff86154c7700e9c3f209a448d09419944d71ec6391578c772f50fe926104d"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_amd64.tar.gz"
      sha256 "cc224345726864b4aa3ae31a16d2ee47eb3518ebe757b65a797dc1c8bee1cd57"
    end
  end

  def install
    bin.install "aps"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{bin}/aps" if OS.mac?
  end

  test do
    assert_match "aps", shell_output("#{bin}/aps -V")
  end
end
