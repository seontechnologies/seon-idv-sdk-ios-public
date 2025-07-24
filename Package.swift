// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SEONIdVerification",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SEONIdVerification",
            targets: ["SEONIDV"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/BlinkID/capture-core-sp", from: "1.3.1"),
        .package(url: "https://github.com/BlinkID/capture-ux-sp", from: "1.3.1"),
        .package(url: "https://github.com/hmlongco/Resolver", from: "1.5.1"),
    ],
    targets: [
        .target(
            name: "SEONIDV",
            dependencies: [
                .target(name: "SEONIdVerification"),
                .target(name: "BlinkID"),
                .product(name: "CaptureCore", package: "capture-core-sp"),
                .product(name: "CaptureUX", package: "capture-ux-sp"),
            ]
        ),
        .binaryTarget(
            name: "SEONIdVerification",
            url: "https://github.com/seontechnologies/seon-idv-sdk-ios-public/releases/download/v2.0.1/IDV_SPM_Modern.zip",
            checksum: "862302390aaa60cc205032e958f593a423c6faf78246579647777456e73fc0a2"
        ),
        .binaryTarget(
            name: "BlinkID",
            url: "https://github.com/BlinkID/blinkid-ios/releases/download/v7.3.0/BlinkID.xcframework.zip",
            checksum: "61b35749e99a2df0d609359170b76d5c72279398391b6e907aaf073eaf972476"
        )
    ]
)
