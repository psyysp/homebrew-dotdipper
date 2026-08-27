# Homebrew Formula for Dotdipper
# brew tap psyysp/dotdipper && brew install dotdipper

class Dotdipper < Formula
  desc "A safe, deterministic, and feature-rich dotfiles manager built in Rust"
  homepage "https://github.com/psyysp/dotdipper"
  version "0.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/psyysp/dotdipper/releases/download/v0.7.5/dotdipper-aarch64-apple-darwin.tar.gz"
      sha256 "5f5f484c1ce88a13a5dc392b64b5881fe7f7faf579d1c7cbcfcb3d9aa314e3f4"
    end
    on_intel do
      url "https://github.com/psyysp/dotdipper/releases/download/v0.7.5/dotdipper-x86_64-apple-darwin.tar.gz"
      sha256 "d4aa6786a0b7d7d169f9b808553eb3471080c079940fdbcd75670785c81e54d3"
    end
  end

  depends_on :macos
  depends_on "age"

  def install
    bin.install "dotdipper"
  end

  def caveats
    <<~EOS
      Dotdipper has been installed!

      To get started:
        dotdipper init

      For help:
        dotdipper --help
    EOS
  end

  test do
    assert_match "dotdipper", shell_output("#{bin}/dotdipper --version")
  end
end
