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
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-aarch64-apple-darwin.tar.gz"
      sha256 "6244baec08199de60815a67c2bac7f256c00817b8db9a3c9e07126f7d2edd689"
    else
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-x86_64-apple-darwin.tar.gz"
      sha256 "38e889f643182375770a416e6d37f852b3c13ee4c074432764aa31f83b36f8eb"
    end
  end
  depends_on :macos

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
