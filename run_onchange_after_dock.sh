#!/usr/bin/env bash
set -euo pipefail

# Clear all app tiles from the Dock (left of the divider).
defaults write com.apple.dock persistent-apps -array

# Clear folder tiles (right of the divider — Downloads, Documents, etc.).
defaults write com.apple.dock persistent-others -array

killall Dock
