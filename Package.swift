// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUITemplateReusableComponent",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "SwiftUITemplateReusableComponent",
            targets: ["SwiftUITemplateReusableComponent"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftUITemplateReusableComponent"
        ),
        .testTarget(
            name: "SwiftUITemplateReusableComponentTests",
            dependencies: ["SwiftUITemplateReusableComponent"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
