// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "FeedKit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(name: "FeedKit", targets: ["FeedKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "1.0.0")
    ],
    targets: [
        .target(name: "FeedKit", dependencies: []),
        .testTarget(
            name: "Tests",
            dependencies: ["FeedKit", .product(name: "CustomDump", package: "swift-custom-dump")],
            path: "Tests",
            resources: [
                .copy("json"),
                .copy("xml")
            ]
        )
    ]
)
