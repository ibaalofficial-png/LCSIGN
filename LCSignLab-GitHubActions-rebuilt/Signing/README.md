# LCSignLab signing

Keep signing credentials out of the repository.

Recommended GitHub Actions secrets:
- BUILD_CERTIFICATE_BASE64 — base64 encoded .p12
- P12_PASSWORD — password for the .p12
- PROVISIONING_PROFILE_BASE64 — base64 encoded provisioning profile
- KEYCHAIN_PASSWORD — temporary CI keychain password
- TEAM_ID — Apple Developer Team ID

For an Ad Hoc build, the provisioning profile must match the Bundle ID, signing certificate, Team ID, and registered device UDIDs.

Do not commit .p12, provisioning profiles, private keys, or passwords.
