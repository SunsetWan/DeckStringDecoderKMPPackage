// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "DeckStringDecoderPublicConsumer",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "DeckStringDecoderPublicConsumer",
            targets: ["DeckStringDecoderPublicConsumer"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/SunsetWan/DeckStringDecoderKMPPackage.git",
            exact: "0.1.0-kmp.3"
        ),
    ],
    targets: [
        .target(
            name: "DeckStringDecoderPublicConsumer",
            dependencies: [
                .product(name: "DeckStringDecoder", package: "DeckStringDecoderKMPPackage"),
            ]
        ),
        .testTarget(
            name: "DeckStringDecoderPublicConsumerTests",
            dependencies: [
                "DeckStringDecoderPublicConsumer",
                .product(name: "DeckStringDecoder", package: "DeckStringDecoderKMPPackage"),
            ]
        ),
    ]
)
