#!/bin/bash

defaults write com.apple.finder AppleShowAllFiles YES

brew analytics off

# Allow apps from unindentifeid developers
sudo spctl --master-disable
