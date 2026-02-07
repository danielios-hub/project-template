// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Journal",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Journal",
            targets: ["Journal"]),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../Editor"),
        .package(path: "../News"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Journal",
            dependencies: [
                "Core",
                "Editor",
                "News",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
    ]
)
