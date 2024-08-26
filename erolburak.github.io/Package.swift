// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ErolBurakGitHubIO",
    platforms: [
        .macOS(
            .v14
        )
    ],
    products: [
        .executable(
            name: "ErolBurakGitHubIO",
            targets: [
                "ErolBurakGitHubIO"
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
            name: "ErolBurakGitHubIO",
            dependencies: [
                "Publish"
            ]
        )
    ]
)
