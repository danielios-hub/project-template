// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "More",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "More",
            targets: ["More"]),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../Editor"),
        .package(path: "../News"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "More",
            dependencies: [
                "Core",
                "Editor",
                "News",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
    ]
)
