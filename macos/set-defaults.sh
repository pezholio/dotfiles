#!/bin/zsh

# Set the wallpaper
if desktoppr 1 "$HOME/.dotfiles/wallpaper/jazzcats.jpg"; then
  desktoppr 0 "$HOME/.dotfiles/wallpaper/benny.jpg"
else
  desktoppr 0 "$HOME/.dotfiles/wallpaper/jazzcats.jpg"
fi

# Hide desktop icons
defaults write com.apple.finder CreateDesktop false
killall Finder

# Set up keymapping for media keys
mkdir -p ~/Library/LaunchAgents
ln -sfn "$HOME/.dotfiles/macos/keymapping.plist" ~/Library/LaunchAgents/com.user.hidutilMediaKeys.plist
launchctl bootstrap "gui/$(id -u)" ~/Library/LaunchAgents/com.user.hidutilMediaKeys.plist

# Set the mouse button mode to two-button for Apple Multitouch Mouse and Bluetooth Multitouch Mouse
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string TwoButton
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton

# Use F1-F12 keys as standard function keys
defaults write -g com.apple.keyboard.fnState -bool true

# Swap the Command and Option keys for my external keyboard (currently a Filco Majestouch 2)
KEY='com.apple.keyboard.modifiermapping.12029-30738-0'
OPTION='30064771298'
COMMAND='30064771299'

defaults -currentHost write -g "$KEY" -array \
  "<dict><key>HIDKeyboardModifierMappingSrc</key><integer>${OPTION}</integer><key>HIDKeyboardModifierMappingDst</key><integer>${COMMAND}</integer></dict>" \
  "<dict><key>HIDKeyboardModifierMappingSrc</key><integer>${COMMAND}</integer><key>HIDKeyboardModifierMappingDst</key><integer>${OPTION}</integer></dict>"