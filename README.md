# DeckStringDecoderKMPPackage

SwiftPM binary package wrapper for the KMP/SKIE build of `DeckStringDecoder`.

This repository is the public SwiftPM entry point. The KMP source repository remains responsible for Kotlin Multiplatform source, tests, XCFramework generation, and release automation.

## Installation

Add this package in Xcode or SwiftPM:

```text
https://github.com/SunsetWan/DeckStringDecoderKMPPackage.git
```

Use version:

```text
0.1.0-kmp.2
```

Import the module as before:

```swift
import DeckStringDecoder
```

## Platform Scope

The current binary artifact contains iOS device and iOS Simulator slices only. It does not currently include macOS, watchOS, tvOS, or visionOS slices.

## Artifact

- Release tag: `0.1.0-kmp.2`
- Asset: `DeckStringDecoder.xcframework.zip`
- URL: `https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.2/DeckStringDecoder.xcframework.zip`
- Checksum: `27a297695a500486549462ec4d4b2a7d8bbf2c70a80a18f44b25a221f8d9a6d7`

The SwiftPM manifest uses:

```swift
.binaryTarget(
    name: "DeckStringDecoder",
    url: "https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.2/DeckStringDecoder.xcframework.zip",
    checksum: "27a297695a500486549462ec4d4b2a7d8bbf2c70a80a18f44b25a221f8d9a6d7"
)
```

## Updating a Release

Releases are generated from `DeckStringDecoderKMP` through its manual release workflow. That workflow builds the XCFramework zip, verifies checksum and module interface contents, updates this wrapper repo, creates the GitHub Release, uploads `DeckStringDecoder.xcframework.zip`, downloads it from the public URL, and runs the public consumer tests.

## Verification

This repository includes a minimal public consumer under `Verification/Consumer`. After the release asset exists, run:

```sh
scripts/verify-public-consumer.sh
```

The consumer verifies `import DeckStringDecoder`, `DeckStringDecoder()` construction, decode, encode round trip, sideboard decoding, and error mapping through the Swift-facing API only.
