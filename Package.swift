// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUITemplateReusuableComponent",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "SwiftUITemplateReusuableComponent",
            targets: ["SwiftUITemplateReusuableComponent"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftUITemplateReusuableComponent"
        ),
        .testTarget(
            name: "SwiftUITemplateReusuableComponentTests",
            dependencies: ["SwiftUITemplateReusuableComponent"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
