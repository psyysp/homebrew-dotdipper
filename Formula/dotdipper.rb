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
      sha256 "a1bc30229a6a0fb5be1d7bcdc46a2370a275502e5ccc5fcb80bf724aa1cdbd0b"
    end
    on_intel do
      url "https://github.com/psyysp/dotdipper/releases/download/v0.7.5/dotdipper-x86_64-apple-darwin.tar.gz"
      sha256 "dad79bec145d1fde9c18ab9b7f706eff11c0f0af9923c9d32ffba3209805d07e"
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
