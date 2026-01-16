# Homebrew Tap for Dotdipper

This is the official Homebrew tap for [Dotdipper](https://github.com/psyysp/dotdipper), a safe, deterministic, and feature-rich dotfiles manager built in Rust.

## Installation

```bash
# Add the tap
brew tap psyysp/dotdipper

# Install dotdipper
brew install dotdipper
```

Or install directly without adding the tap:

```bash
brew install psyysp/dotdipper/dotdipper
```

## Updating

```bash
brew update
brew upgrade dotdipper
```

## Uninstalling

```bash
brew uninstall dotdipper
brew untap psyysp/dotdipper
```

## What Gets Installed

- `dotdipper` - The main CLI binary
- `age` - Required dependency for secrets encryption

## Getting Started

After installation:

```bash
# Initialize dotdipper
dotdipper init

# Set up secrets encryption (optional)
dotdipper secrets init

# Discover your dotfiles
dotdipper discover --write

# Create your first snapshot
dotdipper snapshot -m "Initial snapshot"
```

## Documentation

For full documentation, visit the [main repository](https://github.com/psyysp/dotdipper).

## Issues

If you encounter any issues with the Homebrew formula, please [open an issue](https://github.com/psyysp/homebrew-dotdipper/issues).

For issues with dotdipper itself, please use the [main repository's issue tracker](https://github.com/psyysp/dotdipper/issues).
