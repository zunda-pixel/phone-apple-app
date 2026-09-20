// swift-tools-version: 6.4

import PackageDescription

let package = Package(
  name: "PhoneApp",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v27),
    .macOS(.v27)
  ],
  products: [
    .library(
      name: "PhoneApp",
      targets: ["PhoneApp"]
    ),
  ],
  targets: [
    .target(
      name: "PhoneApp"
    ),
    .testTarget(
      name: "PhoneAppTests",
      dependencies: ["PhoneApp"]
    ),
  ]
)
