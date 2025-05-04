// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UITextView_Placeholder",
    products: [
        .library(
            name: "UITextView_Placeholder",
            targets: ["UITextView_Placeholder"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UITextView_Placeholder",
            path: "Sources",
            publicHeadersPath: "Sources"),
    ]
)
