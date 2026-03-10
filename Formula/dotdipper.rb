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
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-aarch64-apple-darwin.tar.gz"
      sha256 "f5f1f56eb1a059569bf7636d98568777fe3f7fc914cfd8c99e3ea78d9d9c49d5"
    end
    on_intel do
      url "https://github.com/psyysp/dotdipper/releases/download/v#{version}/dotdipper-x86_64-apple-darwin.tar.gz"
      sha256 "062eef97f4e18710b8e21369595afe04defdd69eab16b4636f5515387191dc2b"
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
