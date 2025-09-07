# Justfile for AutoMountNFS development

# Show available recipes
default:
    @just --list

# Format shell scripts with shfmt
format:
    shfmt -i 4 -ci -sr -w automountnfs

# Run pre-commit hooks on all files
lint:
    pre-commit run --all-files

# Install pre-commit hooks
setup:
    pre-commit install

# Test the automountnfs script (dry run check)
test:
    bash -n automountnfs
    @echo "✓ Script syntax is valid"

# Clean build artifacts
clean:
    rm -f *.pkg.tar.* *.log
    rm -rf pkg/ src/

# Build the Arch package
build: clean
    makepkg -f

# Update checksums and build/ship package
build-and-ship: clean
    updpkgsums
    # Generate .SRCINFO for all PKGBUILDs
    find . -maxdepth 2 -name PKGBUILD | while read -r file; do makepkg --printsrcinfo > "$(dirname "$file")/.SRCINFO"; done
    # Setup temporary pacman.conf with alvaone repo
    rm -f /tmp/pacman.conf
    cp /usr/share/devtools/pacman.conf.d/extra.conf /tmp/pacman.conf
    cat /etc/pacman.d/alvaone >> /tmp/pacman.conf
    # Build package with aur build
    aur build --force --remove --verify --gpg-sign --database=alvaone --chroot --pacman-conf /tmp/pacman.conf --no-sync

# Install the package locally
install: build
    sudo pacman -U automountnfs-*.pkg.tar.xz --noconfirm

# Check script with shellcheck
check:
    shellcheck automountnfs

# Run audit checks (pre-commit with useful hooks)
audit:
    @echo "Running pre-commit audit checks..."
    pre-commit run --all-files

# Run all quality checks
qa: format lint check test
    @echo "✓ All quality checks passed"
