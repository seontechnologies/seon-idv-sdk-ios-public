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
            targets: ["SEONIdVerification"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SEONIdVerification",
            url: "https://s3.us-east-1.amazonaws.com/idv-static.native-sdk.seondev.space/sdk-releases/1.5.1/SEONIdVerification_SPM.zip",
            checksum: "1c789022a9bb20a62cf5935d449f5272639daaf3a315d025e34eb30adf565676"
        )
    ]
)
