#!/usr/bin/env bash
set -euo pipefail

# ── Finder ────────────────────────────────────────────────────────────────
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
chflags nohidden "${HOME}/Library"

# ── Typing ────────────────────────────────────────────────────────────────
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# ── Input ─────────────────────────────────────────────────────────────────
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Tap-to-click (built-in trackpad + bluetooth + login screen)
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# ── Screenshots ───────────────────────────────────────────────────────────
mkdir -p "${HOME}/Screenshots"
defaults write com.apple.screencapture location "${HOME}/Screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

# ── Menu bar / system-wide ────────────────────────────────────────────────
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# ── Appearance ────────────────────────────────────────────────────────────
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
defaults delete NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically 2>/dev/null || true

# ── System ────────────────────────────────────────────────────────────────
# Require password immediately after sleep / screensaver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Speed up animations
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# ── Apply ─────────────────────────────────────────────────────────────────
killall Finder || true
killall Dock || true
killall SystemUIServer || true
killall ControlCenter || true

echo "Note: some changes (key repeat, tap-to-click) only take full effect after logout/reboot."
