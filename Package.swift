// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "DeckStringDecoderKMPPackage",
    platforms: [
        .iOS(.v15),
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
            url: "https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.5/DeckStringDecoder.xcframework.zip",
            checksum: "c3f1e218e3146363ec1cafd37b7a406da2fdd7694328b55aead6077fc3e50ccb"
        ),
    ]
)
