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
            url: "https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.4/DeckStringDecoder.xcframework.zip",
            checksum: "ff9885585dd56d69ea17c32b9986f2377fcce01155f726609a2e6eed9584fae3"
        ),
    ]
)
