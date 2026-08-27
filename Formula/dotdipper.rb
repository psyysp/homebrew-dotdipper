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
      sha256 "ebb26137a81c0f143d7204c0200940ae702b1af870c40c818c8cc5f0e211b373"
    end
    on_intel do
      url "https://github.com/psyysp/dotdipper/releases/download/v0.7.5/dotdipper-x86_64-apple-darwin.tar.gz"
      sha256 "af3937406695db73b4426e10edce104f892eeeb0c3b67dd917bb177287eb85c4"
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
