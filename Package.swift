// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIExtras",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SwiftUIExtras",
            targets: ["SwiftUIExtras"]),
    ],
    targets: [
        .target(
            name: "SwiftUIExtras",
            dependencies: [])
    ]
)
