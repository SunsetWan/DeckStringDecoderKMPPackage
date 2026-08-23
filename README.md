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
0.1.0-kmp.5
```

Import the module as before:

```swift
import DeckStringDecoder
```

## Platform Scope

The current binary artifact contains iOS device and iOS Simulator slices only. It does not currently include macOS, watchOS, tvOS, or visionOS slices.

## Artifact

- Release tag: `0.1.0-kmp.5`
- Asset: `DeckStringDecoder.xcframework.zip`
- URL: `https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.5/DeckStringDecoder.xcframework.zip`
- Checksum: `c3f1e218e3146363ec1cafd37b7a406da2fdd7694328b55aead6077fc3e50ccb`

The SwiftPM manifest uses:

```swift
.binaryTarget(
    name: "DeckStringDecoder",
    url: "https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.5/DeckStringDecoder.xcframework.zip",
    checksum: "c3f1e218e3146363ec1cafd37b7a406da2fdd7694328b55aead6077fc3e50ccb"
)
```

## Updating a Release

Releases are generated from `DeckStringDecoderKMP` through its manual release workflow. That workflow builds the XCFramework zip, verifies checksum and module interface contents, updates this wrapper repo, creates the GitHub Release, uploads `DeckStringDecoder.xcframework.zip`, downloads it from the public URL, and runs the public consumer tests.

## Verification

This repository includes a minimal public consumer under `Verification/Consumer`. After the release asset exists, run:

```sh
scripts/verify-public-consumer.sh
```

The consumer verifies `import DeckStringDecoder`, `DeckStringDecoder()` construction, decode, encode round trip, sideboard decoding, error mapping, and native Swift model conformances through the Swift-facing API only.
