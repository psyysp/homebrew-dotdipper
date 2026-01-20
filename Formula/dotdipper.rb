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
    if Hardware::CPU.arm?
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-aarch64-apple-darwin.tar.gz"
      sha256 "c213bdd7f5d154bfbafacc27d654daf1e082daab2466e054f143c4832d5c5690"
    else
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-x86_64-apple-darwin.tar.gz"
      sha256 "6db27cd120a903f7b69c52f1775b1e6cf7652e4a6e54f01cb2d594dc0b983bad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "LINUX_ARM64_SHA256_PLACEHOLDER"
    else
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "LINUX_X86_64_SHA256_PLACEHOLDER"
    end
  end

  # Age is required for secrets encryption feature
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
    # Test that the binary runs and shows version
    assert_match "dotdipper", shell_output("#{bin}/dotdipper --version")
    
    # Test that help works
    assert_match "dotfiles manager", shell_output("#{bin}/dotdipper --help")
  end
end
