# DeckStringDecoderKMPPackage

SwiftPM source facade and portable model contract for the KMP deck codec.

This repository is the public SwiftPM entry point. The KMP source repository remains responsible for Kotlin Multiplatform source, tests, XCFramework generation, and release automation.

## Installation

Add this package in Xcode or SwiftPM:

```text
https://github.com/SunsetWan/DeckStringDecoderKMPPackage.git
```

Use version:

```text
0.1.0-kmp.6
```

Import the module as before:

```swift
import DeckStringDecoder
```

## Platform Scope

The `DeckStringModels` source product supports macOS 14 and iOS 15. The `DeckStringDecoder` facade and `DeckStringRuntime` binary support iOS only.

The facade uses aliases to the portable model types. Consumers must rebuild: moving these public types changes nominal module identity and is not an ABI-compatible binary replacement. JSON fields, integer formats, required-field failures, and value ordering retain their existing behavior.

Swift sources are generated from `DeckStringDecoderKMP/swiftpm-binary/Sources`. Make source changes there; do not maintain separate model implementations in this distribution repository.

## Artifact

- Release tag: `0.1.0-kmp.6`
- Asset: `DeckStringRuntime.xcframework.zip`
- URL: `https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.6/DeckStringRuntime.xcframework.zip`
- Checksum: `a0ece886f9bf135302103bef30c5568fba0f42a18809a76dfdbece7013b847e7`

The SwiftPM manifest uses:

```swift
.binaryTarget(
    name: "DeckStringRuntime",
    url: "https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.6/DeckStringRuntime.xcframework.zip",
    checksum: "a0ece886f9bf135302103bef30c5568fba0f42a18809a76dfdbece7013b847e7"
)
```

## Updating a Release

Releases are generated from `DeckStringDecoderKMP` through its manual release workflow. That workflow builds the XCFramework zip, verifies checksum and module interface contents, updates this wrapper repo, creates the GitHub Release, uploads `DeckStringRuntime.xcframework.zip`, downloads it from the public URL, and runs the public consumer tests.

## Verification

This repository includes a minimal public consumer under `Verification/Consumer`. After the release asset exists, run:

```sh
scripts/verify-public-consumer.sh
```

The consumer verifies `import DeckStringDecoder`, `DeckStringDecoder()` construction, decode, encode round trip, sideboard decoding, and error mapping through the Swift-facing API only.
