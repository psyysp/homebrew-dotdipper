# Homebrew Formula for Dotdipper
# This formula installs pre-built binaries for macOS
#
# To use this tap:
#   brew tap psyysp/dotdipper
#   brew install dotdipper
#
# Or install directly:
#   brew install psyysp/dotdipper/dotdipper

class Dotdipper < Formula
  desc "A safe, deterministic, and feature-rich dotfiles manager built in Rust"
  homepage "https://github.com/psyysp/dotdipper"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-aarch64-apple-darwin.tar.gz"
      sha256 "783eb745c866daac0f5e0caaecea79068131362b07a48f6d273860fa50e879ca"
    end
    on_intel do
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-x86_64-apple-darwin.tar.gz"
      sha256 "397be4859566fd6bf3d71c2fd4d97e75e14ea8384fbb6b10dd6e7a0d0d4025b6"
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

      For secrets encryption, 'age' has been installed as a dependency.
      To set up secrets encryption:
        dotdipper secrets init
    EOS
  end

  test do
    assert_match "dotdipper", shell_output("#{bin}/dotdipper --version")
    assert_match "dotfiles", shell_output("#{bin}/dotdipper --help")
  end
end
