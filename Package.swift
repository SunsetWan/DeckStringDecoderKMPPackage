// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "DeckStringDecoderKMPPackage",
    platforms: [.iOS(.v15), .macOS(.v14)],
    products: [
        .library(name: "DeckStringModels", targets: ["DeckStringModels"]),
        .library(name: "DeckStringDecoder", targets: ["DeckStringDecoder"]),
    ],
    targets: [
        .binaryTarget(name: "DeckStringRuntime", url: "https://github.com/SunsetWan/DeckStringDecoderKMPPackage/releases/download/0.1.0-kmp.6/DeckStringRuntime.xcframework.zip", checksum: "a0ece886f9bf135302103bef30c5568fba0f42a18809a76dfdbece7013b847e7"),
        .target(name: "DeckStringModels"),
        .target(name: "DeckStringDecoder", dependencies: [
            "DeckStringModels",
            .target(name: "DeckStringRuntime", condition: .when(platforms: [.iOS])),
        ]),
        .testTarget(name: "DeckStringModelsTests", dependencies: ["DeckStringModels"]),
        .testTarget(name: "DeckStringDecoderTests", dependencies: ["DeckStringDecoder"]),
    ],
    swiftLanguageModes: [.v5]
)
