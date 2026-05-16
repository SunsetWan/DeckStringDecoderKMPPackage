# DeckStringDecoderKMPPackage

SwiftPM binary package wrapper for the KMP/SKIE build of `DeckStringDecoder`.

This repository is the public SwiftPM entry point. The private/source repository remains responsible for Kotlin Multiplatform source, tests, and XCFramework generation.

## Installation

Add this package in Xcode or SwiftPM:

```text
https://github.com/SunsetWan/DeckStringDecoderKMPPackage.git
```

Use version:

```text
0.1.0-kmp.1
```

Import the module as before:

```swift
import DeckStringDecoder
```

## Platform Scope

The current binary artifact contains iOS device and iOS Simulator slices only. It does not currently include macOS, watchOS, tvOS, or visionOS slices.

## Artifact

- Release tag: `0.1.0-kmp.1`
- Asset: `DeckStringDecoder.xcframework.zip`
- URL: `https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.1/DeckStringDecoder.xcframework.zip`
- Checksum: `f4e918c615c3da0667f2e5c747ce798521c313fd03eee099a47a39972cd9de17`

The SwiftPM manifest uses:

```swift
.binaryTarget(
    name: "DeckStringDecoder",
    url: "https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.1/DeckStringDecoder.xcframework.zip",
    checksum: "f4e918c615c3da0667f2e5c747ce798521c313fd03eee099a47a39972cd9de17"
)
```

## Updating a Release

1. Build a new release `DeckStringDecoder.xcframework` in the source repository.
2. Zip it as `DeckStringDecoder.xcframework.zip` with `DeckStringDecoder.xcframework` at the zip root.
3. Run `swift package compute-checksum DeckStringDecoder.xcframework.zip`.
4. Upload the zip to this repository's GitHub Release for the new tag.
5. Update `Package.swift`, `CHANGELOG.md`, and `releases/<tag>.md` with the new URL and checksum.
6. Run `scripts/verify-public-consumer.sh`.

## Verification

This repository includes a minimal public consumer under `Verification/Consumer`. After the release asset exists, run:

```sh
scripts/verify-public-consumer.sh
```

The consumer verifies `import DeckStringDecoder`, `DeckStringDecoder()` construction, decode, encode round trip, sideboard decoding, and error mapping through the Swift-facing API only.
