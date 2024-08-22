// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ErolburakMe",
    platforms: [
        .macOS(
            .v12
        )
    ],
    products: [
        .executable(
            name: "ErolburakMe",
            targets: [
                "ErolburakMe"
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
            name: "ErolburakMe",
            dependencies: [
                "Publish"
            ]
        )
    ]
)
