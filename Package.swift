// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iAVLPlusSQLite",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "SQLiteNodeDB", targets: ["SQLiteNodeDB"]),
//        .library(name: "FlatBufferNodeDB", targets: ["FlatBufferNodeDB"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "iAVLPlus", url: "https://github.com/cosmosswift/swift-iavlplus.git", from: "0.2.0"),
        .package(name: "GRDB", url: "https://github.com/groue/GRDB.swift.git", from: "4.0.0"),
        //.package(url: "https://github.com/vapor/sqlite-nio.git", .branch("main")),
        // .package(url: "ObjectBox", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
//        .target(name: "SQLiteNodeDB", dependencies: ["iAVLPlusCore", "SQLiteNIO"]),
        .target(name: "SQLiteNodeDB", dependencies: [.product(name: "iAVLPlus", package: "iAVLPlus"), "GRDB"]),
        .testTarget(name: "SQLiteNodeDBTests", dependencies: [.product(name: "iAVLPlus", package: "iAVLPlus"), "SQLiteNodeDB"]),
    ]
)
