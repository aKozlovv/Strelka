// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StrelkaUI",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "StrelkaUI",
            targets: ["StrelkaUI"]),
    ],
    targets: [
        .target(
            name: "StrelkaUI"),

    ]
)
