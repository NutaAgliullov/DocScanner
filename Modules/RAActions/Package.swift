// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RAActions",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "RAActions",
            targets: ["RAActions"]),
    ],
    dependencies: [
        .package(path: "/Users/raisagliullov/Work/HomeProjects/SharedModules/RAUI"),
        .package(path: "/Users/raisagliullov/Work/HomeProjects/SharedModules/RAFoundation"),
    ],
    targets: [
        .target(
            name: "RAActions",
            dependencies: [
                "RAUI",
                "RAFoundation"
            ])
    ]
)
