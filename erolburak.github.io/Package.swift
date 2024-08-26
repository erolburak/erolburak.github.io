// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "erolburak.github.io",
    platforms: [
        .macOS(
            .v14
        )
    ],
    products: [
        .executable(
            name: "erolburak.github.io",
            targets: [
                "erolburak.github.io"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/Ze0nC/Publish.git",
            branch: "Multi-Language"
        ),
        .package(
            url: "https://github.com/nicklockwood/SwiftFormat.git",
            branch: "main"
        )
    ],
    targets: [
        .executableTarget(
            name: "erolburak.github.io",
            dependencies: [
                "Publish"
            ]
        )
    ]
)
