# LCSignLab

SwiftUI starter for iOS 26+, with a GitHub Actions build pipeline.

## GitHub Actions

Push this repository to GitHub and run **Actions → Build LCSignLab**.

The current workflow creates an unsigned `.app` artifact so the project can be validated without exposing signing credentials.

Signing can be added after the first successful build using GitHub Secrets and a valid Apple Developer certificate/profile.
