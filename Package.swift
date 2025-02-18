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
            url: "https://github.com/seontechnologies/seon-idv-sdk-ios-public/releases/download/1.2.4/SEONIdVerification.zip",
            checksum: "af15315346a66fdc0808fb95a0cc51d1c5ce9f89bd8e1f0620bc2d12e32c8567"
        )
    ]
)
