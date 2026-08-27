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
      sha256 "daaf2665840c997c3e009d7b41db3dfe44922bb1b7b7eeef78f7636bc1bba13f"
    end
    on_intel do
      url "https://github.com/psyysp/dotdipper/releases/download/v0.7.5/dotdipper-x86_64-apple-darwin.tar.gz"
      sha256 "d0e9b6fb00fc5bc405a1661e22a7bfe597405861227a7ce0b1e38d3b671f1714"
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
