# LCSignLab

A native SwiftUI iOS 26+ starter with a real Xcode project and GitHub Actions
build validation.

## Build locally
Open `LCSignLab.xcodeproj` in Xcode 26 or newer, select an iOS Simulator or
a connected device, then Build.

## GitHub Actions
Push to GitHub and run **Actions → Build LCSignLab**. The workflow builds an
unsigned Release app and uploads it as an artifact.

Signing credentials are intentionally kept out of the repository.
