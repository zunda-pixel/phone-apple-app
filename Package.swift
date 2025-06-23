// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "PhoneApp",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v26),
    .macOS(.v26)
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
