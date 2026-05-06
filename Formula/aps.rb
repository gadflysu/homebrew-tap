class Aps < Formula
  desc "Interactive session picker for Claude Code and Opencode"
  homepage "https://github.com/gadflysu/aps"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_arm64.tar.gz"
      sha256 "85421bfb2cfb66a734cfc08fe54429ad85a8ffa205cc34af5089e4502f3b3181"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_amd64.tar.gz"
      sha256 "c742772a50115effb0704d0c7eea0abcf620b70eae1e778e6d84ff043b33ca45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_arm64.tar.gz"
      sha256 "aebd70c2fe7dac47556afd76bbdd35c564fa110ed71ce5811e0f08af96b1f27f"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_amd64.tar.gz"
      sha256 "a0392f7f2c7b75a0954c6ef5bb1920c07146fe1d349187bd250a9606e52b4a05"
    end
  end

  def install
    bin.install "aps"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{bin}/aps"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/aps -h")
  end
end
