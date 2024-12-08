import Foundation
import ProjectDescription

public struct ProjectInfo {
    
    public static let name = "FediverseClient"
    
    public static let bundleIdPrefix = "com.Nazku."

    public static let organizationName = "com.Nazku"
    
    public static let settings: Settings = .settings(
        base: [:],
        configurations: .default,
        defaultSettings: .recommended
    )
    
    public static let schemes: [Scheme] = [
        .scheme(
            name: "\(name)-DEV",
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            runAction: .runAction(configuration: .dev),
            archiveAction: .archiveAction(configuration: .dev),
            profileAction: .profileAction(configuration: .dev),
            analyzeAction: .analyzeAction(configuration: .dev)
        ),
        .scheme(
            name: "\(name)-STAGE",
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            runAction: .runAction(configuration: .stage),
            archiveAction: .archiveAction(configuration: .stage),
            profileAction: .profileAction(configuration: .stage),
            analyzeAction: .analyzeAction(configuration: .stage)
        ),
        .scheme(
            name: "\(name)-PROD",
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            runAction: .runAction(configuration: .prod),
            archiveAction: .archiveAction(configuration: .prod),
            profileAction: .profileAction(configuration: .prod),
            analyzeAction: .analyzeAction(configuration: .prod)
        )
    ]
}
