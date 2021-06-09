// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxViewController",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "RxViewController", targets: ["RxViewController"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0"))
    ],
    targets: [
        .target(
            name: "RxViewController",
            dependencies: [
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift"),
            ]),
        .testTarget(
            name: "RxViewControllerTests",
            dependencies: ["RxViewController"]),
    ]
)
