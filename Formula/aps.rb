class Aps < Formula
  desc "Interactive session picker for Claude Code and Opencode"
  homepage "https://github.com/gadflysu/aps"
  version "0.3.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_arm64.tar.gz"
      sha256 "c4f5cdd92867abf24205196075beb688dd25e00d8c092d50a72f9ce0c57a9280"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_amd64.tar.gz"
      sha256 "f623831f14c88636beefb46aeac3ec079dcead1f004840bae7961857a9039f72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_arm64.tar.gz"
      sha256 "90a4e2a4629c69e771834c4e2a92d79d90129e00e9f7a4d5daef08a646e65381"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_amd64.tar.gz"
      sha256 "3e3c878125b6a1c1e254bd8eaa9f99a4779750a4d514d00bacebb06e18116d74"
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
