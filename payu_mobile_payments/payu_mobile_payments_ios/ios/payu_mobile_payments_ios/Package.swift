// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "payu_mobile_payments_ios",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "payu-mobile-payments-ios", targets: ["payu_mobile_payments_ios"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "payu_mobile_payments_ios",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ]
        )
    ]
)
