class Aps < Formula
  desc "Interactive session picker for Claude Code and Opencode"
  homepage "https://github.com/gadflysu/aps"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_arm64.tar.gz"
      sha256 "23bca3990fe3d69b0f014112d5ccb90540b5195c4fe7a312c21d2f2fced265b6"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_darwin_amd64.tar.gz"
      sha256 "380314ff691fb49575cbdca20d8f38fe9890a599c8478d7cc300cf7b8b9432e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_arm64.tar.gz"
      sha256 "6d1df53100ceb15e6e0e3cdbd039e97b18aeebaa07c24686e86718c97c57425c"
    else
      url "https://github.com/gadflysu/aps/releases/download/v#{version}/aps_linux_amd64.tar.gz"
      sha256 "95c4d22632e57044b33dc5aecdff7881946f3484741a20dec65a1afc67614aaa"
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
