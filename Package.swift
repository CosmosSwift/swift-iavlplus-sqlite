// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "swift-iavlplus-sqlite",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "SQLiteNodeDB", targets: ["SQLiteNodeDB"]),
    ],
    dependencies: [
        .package(name: "swift-iavlplus", url: "https://github.com/cosmosswift/swift-iavlplus.git", .upToNextMajor(from: "0.3.0")),
        .package(name: "GRDB", url: "https://github.com/groue/GRDB.swift.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "SQLiteNodeDB",
            dependencies: [
                .product(name: "iAVLPlus", package: "swift-iavlplus"),
                "GRDB"
            ]
        ),
        .testTarget(
            name: "SQLiteNodeDBTests",
            dependencies: [
                .product(name: "iAVLPlus", package: "swift-iavlplus"),
                "SQLiteNodeDB"
            ]
        ),
    ]
)
