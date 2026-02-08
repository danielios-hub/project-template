// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Editor",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "Editor",
            targets: ["Editor"])
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Editor",
            dependencies: [
                "Core",
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            swiftSettings: [
                .defaultIsolation(MainActor.self)
            ]
        )
    ]
)
