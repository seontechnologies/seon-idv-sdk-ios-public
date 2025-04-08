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
            type: .binary,
            targets: ["SEONIdVerification"]
        ),
    ],
    targets: [
        .binary(
            name: "SEONIdVerification",
            url: "https://s3.us-east-1.amazonaws.com/idv-static.native-sdk.seondev.space/sdk-releases/1.5.0/SEONIdVerification.zip",
            checksum: "f7a71ec0ae9ab2c0df86c62d641445a240faf54d69fd8b601a6ec20d0edbf7b6"
        ),
    ]
)
