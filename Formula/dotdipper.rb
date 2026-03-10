# Homebrew Formula for Dotdipper
# This formula installs pre-built binaries for macOS and Linux
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
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-aarch64-apple-darwin.tar.gz"
      sha256 "a815b49accdd30733bb2281d2dbc7650b242f5bc294e895cc8e46f2df535aba1"
    else
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-x86_64-apple-darwin.tar.gz"
      sha256 "a3a748e1cd427f009c481c9f4b18d63668cc23e11f26738692f4d1f0636a02b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_NEEDS_UPDATE"
    else
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_NEEDS_UPDATE"
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
