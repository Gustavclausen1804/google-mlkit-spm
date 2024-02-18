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
        .binaryTarget(name: "MLImage", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.4/MLImage.xcframework.zip", checksum: "332b4d987bd5ae8b443e1399b4d0eaf4917b1016475b32368ba1677e4c36acff"),
        .binaryTarget(name: "MLKitBarcodeScanning", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.4/MLKitBarcodeScanning.xcframework.zip", checksum: "c0e1b16cd635f1a37e6cc34223926215e4ad6e86bb73c937ed330dfaa65a8910"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.4/MLKitCommon.xcframework.zip", checksum: "41c2d13e1c1c115a4be2c170d6c760ba6294fde9bcb0b4a7ddad8e208e00e9c5"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.4/MLKitVision.xcframework.zip", checksum: "bd7adcc96b2c4d4ad682a526c878e4dcbb887756ba9f4ab02d342fb94572934c"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.4/GoogleToolboxForMac.xcframework.zip", checksum: "972f8e927571943bb8b1f1573b75e55b3061bec98a111139bf4790ac79b9f488"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.4/GoogleUtilitiesComponents.xcframework.zip", checksum: "88144ccedf280cd8eb595195f456b7fb43eccb6f7edbac0cde4f976fe0ee0528"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.4/Protobuf.xcframework.zip", checksum: "9754c66fd46490db0f4d9ee2f16905546028c70923d4102a5fb8f43efc085a15"),
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
