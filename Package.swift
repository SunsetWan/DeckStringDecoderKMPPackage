// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "DeckStringDecoderKMPPackage",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "DeckStringDecoder",
            targets: ["DeckStringDecoder"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DeckStringDecoder",
            url: "https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.2/DeckStringDecoder.xcframework.zip",
            checksum: "27a297695a500486549462ec4d4b2a7d8bbf2c70a80a18f44b25a221f8d9a6d7"
        ),
    ]
)
