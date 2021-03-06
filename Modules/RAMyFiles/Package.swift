// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RAMyFiles",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "RAMyFiles",
            targets: ["RAMyFiles"]),
    ],
    dependencies: [
        .package(path: "../RAUI"),
        .package(path: "../RAFoundation"),
    ],
    targets: [
        .target(
            name: "RAMyFiles",
            dependencies: [
                "RAUI",
                "RAFoundation"
            ]),
        .testTarget(
            name: "RAMyFilesTests",
            dependencies: ["RAMyFiles"]),
    ]
)
