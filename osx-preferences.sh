# make dock auto-hide instantly
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# make dock tiny
defaults write com.apple.dock tilesize -int 23

# make bottom right hot corner show the desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

# enable fast keyboard repeat rate, use a short delay until repeat
defaults write -g KeyRepeat -int 0
defaults write -g InitialKeyRepeat -int 15

# disable press and hold to get foreign keys
defaults write -g ApplePressAndHoldEnabled -bool false

# disable autocorrect
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# disable smart quotes and dashes
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

# set fast mouse tracking speed and enable secondary click
defaults write -g com.apple.mouse.scaling -float 3
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode "TwoButton"

# set fast trackpad speed
defaults write -g com.apple.trackpad.scaling -float 1

# enable three finger drag on the trackpad
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1

# show the day of the week on the clock
defaults write com.apple.menuextra.clock DateFormat "EEE d MMM  HH:mm"

# almost instant window resize
defaults write -g NSWindowResizeTime -float 0.001

# expand the save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# save to disk (not icloud) by default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# check for software updates daily, not weekly
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# don't show hard drives or cds on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -int 0
defaults write com.apple.finder ShowRemovableMediaOnDesktop -int 0

# enable snap to grid for icons on desktop and other views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# prefer showing an untitled file rather than open panel (this affects textedit)
defaults write -g NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
