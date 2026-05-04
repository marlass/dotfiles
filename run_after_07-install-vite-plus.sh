#!/usr/bin/env bash
set -euo pipefail

# Runs on every `chezmoi apply` after dot_zshrc, so the installer
# re-injects its shell snippet if dot_zshrc has clobbered it.
# Skip when both the binary and the shell snippet are intact.
if [ -x "$HOME/.vite-plus/bin/vp" ] && grep -q "vite-plus" "$HOME/.zshrc" 2>/dev/null; then
    exit 0
fi

curl -fsSL https://vite.plus | bash
