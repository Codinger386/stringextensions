// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StringExtensions",
    products: [
        .library(
            name: "StringExtensions",
            targets: ["StringExtensions"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "StringExtensions",
            dependencies: []),
        .testTarget(
            name: "StringExtensionsTests",
            dependencies: ["StringExtensions"]),
    ]
)
