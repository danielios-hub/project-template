// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "News",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "News",
            targets: ["News"])
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../Editor"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "News",
            dependencies: [
                "Core",
                "Editor",
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            swiftSettings: [
                .defaultIsolation(MainActor.self)
            ]
        )
    ]
)
