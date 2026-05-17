# Changelog

## 0.1.0-kmp.3

- Lowered the public SwiftPM wrapper platform to iOS 15.
- Updated the SwiftPM binary target URL to `https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.3/DeckStringDecoder.xcframework.zip`.
- Added `DeckStringDecoderKMPDemo`, an iOS 15 SwiftUI app that consumes the public binary package and displays decoded DBF ID/count rows, including sideboard owner markers.
- Added an iOS demo XCTest target and `scripts/verify-ios-demo.sh`.

## 0.1.0-kmp.2

- Updated the SwiftPM binary target URL to `https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.2/DeckStringDecoder.xcframework.zip`.
- Updated the SwiftPM checksum to `27a297695a500486549462ec4d4b2a7d8bbf2c70a80a18f44b25a221f8d9a6d7`.
- Release automation verified the local artifact, public download checksum, and public consumer tests.


## 0.1.0-kmp.1 - 2026-05-16

- Published the first public SwiftPM binary wrapper for the KMP/SKIE `DeckStringDecoder` XCFramework.
- Added iOS device and iOS Simulator binary target support.
- Added public consumer verification under `Verification/Consumer`.

Artifact URL:

```text
https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.1/DeckStringDecoder.xcframework.zip
```

Checksum:

```text
f4e918c615c3da0667f2e5c747ce798521c313fd03eee099a47a39972cd9de17
```
