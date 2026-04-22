#!/usr/bin/env bash
set -euo pipefail

if command -v vp >/dev/null 2>&1; then
    echo "vite-plus already installed, skipping"
    exit 0
fi

curl -fsSL https://vite.plus | bash
