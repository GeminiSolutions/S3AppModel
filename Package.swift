// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "S3AppModel",
    dependencies: [
        .Package(url: "https://github.com/GeminiSolutions/Auth.git", majorVersion: 0),
        .Package(url: "https://github.com/GeminiSolutions/Places.git", majorVersion: 0),
        .Package(url: "https://github.com/GeminiSolutions/Users.git", majorVersion: 0),
    ]
)
