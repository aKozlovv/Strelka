// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StrelkaCore",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "StrelkaCore",
            targets: ["StrelkaCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Navigator.git", from: "0.9.26")
    ],
    targets: [
        .target(
            name: "StrelkaCore",
            dependencies: [
                .product(name: "NavigatorUI", package: "Navigator")
            ]
        ),

    ]
)
