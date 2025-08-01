// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SEONIdVerification",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SEONIdVerification",
            targets: ["SEONIDV"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/BlinkID/blinkid-ios", from: "6.11.1"),
        .package(url: "https://github.com/BlinkID/capture-core-sp", from: "1.3.1"),
        .package(url: "https://github.com/BlinkID/capture-ux-sp", from: "1.3.1"),
        .package(url: "https://github.com/hmlongco/Resolver", from: "1.5.1")
    ],
    targets: [
        .target(
            name: "SEONIDV",
            dependencies: [
                .target(name: "SEONIdVerification"),
                .product(name: "BlinkID", package: "blinkid-ios"),
                .product(name: "CaptureCore", package: "capture-core-sp"),
                .product(name: "CaptureUX", package: "capture-ux-sp"),
            ]
        ),
        .binaryTarget(
            name: "SEONIdVerification",
            url: "https://github.com/seontechnologies/seon-idv-sdk-ios-public/releases/download/v2.0.1/IDV_SPM.zip",
            checksum: "455977724d8cf87c654a0010f37c6335db7ebebc7e83068c8609c72e41df4b14"
        )
    ]
)
