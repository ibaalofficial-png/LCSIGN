# GitHub Actions signing

Add these repository secrets:

1. `BUILD_CERTIFICATE_BASE64` — base64 of your signing `.p12`
2. `P12_PASSWORD` — password for the `.p12`
3. `PROVISIONING_PROFILE_BASE64` — base64 of your `.mobileprovision`
4. `KEYCHAIN_PASSWORD` — temporary password for the CI keychain
5. `TEAM_ID` — Apple Developer Team ID

The provisioning profile must match:
- Bundle ID: `com.ibaal.LCSignLab`
- signing certificate
- Team ID
- registered UDIDs for an Ad Hoc profile

The workflow installs the certificate into a temporary CI keychain, installs the
profile, archives the app, exports an Ad Hoc IPA, uploads the IPA as a GitHub
Actions artifact, and deletes temporary signing material at the end.

Do not commit `.p12`, `.mobileprovision`, private keys, or passwords.
