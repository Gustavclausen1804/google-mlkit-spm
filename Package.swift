// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "MLKitSPM",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "MLKitBarcodeScanning",
            targets: ["MLKitBarcodeScanning", "MLImage", "MLKitVision", "Common"])
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", from: "2.1.1"),
        .package(url: "https://github.com/google/GoogleDataTransport.git", from: "9.2.0"),
        .package(url: "https://github.com/google/GoogleUtilities.git", from: "7.7.1"),
        .package(url: "https://github.com/google/gtm-session-fetcher.git", from: "3.1.0"),
        .package(url: "https://github.com/firebase/nanopb.git", .upToNextMinor(from: "2.30909.0")),
    ],
    targets: [
        // these binaryTarget will be overriden when GitHub actions run, so do not edit
        .binaryTarget(name: "MLImage", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/MLImage.xcframework.zip", checksum: "4fc7199130382e892e9b259a26ad6793189c92ef0dfbe7adcd897cc8cce3fe2d"),
        .binaryTarget(name: "MLKitBarcodeScanning", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/MLKitBarcodeScanning.xcframework.zip", checksum: "f4260c4b61d4ae6330d3d0f9190254075e523a4e6808b3a205df18b1d08ae361"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/MLKitCommon.xcframework.zip", checksum: "e31cabda78091013e11fb4b5317fd0ef7e0a6932b4dcf068368239a1793f4b99"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/MLKitVision.xcframework.zip", checksum: "a8c65310d74612c2281d2ed811593186e66d0c622ea93882870c14bc9c5ab2ff"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/GoogleToolboxForMac.xcframework.zip", checksum: "75ae25459d45209158bf37970e5bf72b0f672203bbcf1df46a3623db2608f6a7"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/GoogleUtilitiesComponents.xcframework.zip", checksum: "5b22bf1b748bb7d6dcc32604b15f3cb0f3affe94b8fbf96cf7f3f82887a93cca"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/Protobuf.xcframework.zip", checksum: "9bb7f7ecfc0e3578ea1338721c0cd105695d29cff3ed4f54d4996491c4e2934f"),
        .target(
            name: "Common",
            dependencies: [
                "MLKitCommon",
                "GoogleToolboxForMac",
                "GoogleUtilitiesComponents",
                "Protobuf",
                .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
                .product(name: "GULEnvironment", package: "GoogleUtilities"),
                .product(name: "GULISASwizzler", package: "GoogleUtilities"),
                .product(name: "GULLogger", package: "GoogleUtilities"),
                .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
                .product(name: "GULNSData", package: "GoogleUtilities"),
                .product(name: "GULNetwork", package: "GoogleUtilities"),
                .product(name: "GULReachability", package: "GoogleUtilities"),
                .product(name: "GULUserDefaults", package: "GoogleUtilities"),
                .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "nanopb", package: "nanopb"),
                .product(name: "FBLPromises", package: "promises"),
            ]),
    ]
)
