// swift-tools-version: 5.9
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
            url: "https://github.com/seontechnologies/seon-idv-sdk-ios-public/releases/download/1.3.5/SEONIdVerification.xcframework.zip",
            checksum: "ddfe863691a21caf03b4d619490e04a53f542e0eb9d02e7ee50cf6a463f4099b"
        )
    ]
)
