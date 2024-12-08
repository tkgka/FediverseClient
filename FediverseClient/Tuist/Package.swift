// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import EnvPlugin
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
         productTypes: ["Alamofire": .framework,],
//        productTypes: [:],
        baseSettings: .settings(configurations: .default)
    )
#endif

let package = Package(
    name: "Tuist",
    dependencies: [
        // Add your own dependencies here:
         .package(url: "https://github.com/Alamofire/Alamofire", from: "5.9.0"),
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
    ]
)
