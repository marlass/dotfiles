#!/usr/bin/env bash
set -euo pipefail

# Install Claude Code via the native installer on the `latest` channel.
# The Homebrew cask tracks `stable`, which lags; the native install
# self-updates from `latest`. Skip when the binary is already present.
if [ -x "$HOME/.local/bin/claude" ]; then
    exit 0
fi

curl -fsSL https://claude.ai/install.sh | bash -s latest
