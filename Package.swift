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
    targets: [
        .target(name: "FeedKit", dependencies: []),
        .testTarget(
            name: "Tests",
            dependencies: ["FeedKit"],
            path: "Tests",
            resources: [
                .copy("json"),
                .copy("xml")
            ]
        )
    ]
)
