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
      sha256 "d922f1fc93c0ea48d368ea5a2078ef07ec1b21566638ff35c010bb92f9946495"
    else
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-x86_64-apple-darwin.tar.gz"
      sha256 "b238723819da8c1834efce449d3224c2335b276b0963311086200ca0b1f62641"
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
