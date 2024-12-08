import Foundation
import ProjectDescription

// swiftlint: disable all
public enum ModulePaths {
    
    case feature(Feature)
    
public enum Feature: String {
        case Assets
        case GameFeature
        case MiniProgramFeature
        case XMPPFeature
        case UIComponent
        case RSSFeature
        case FediverseFeature
        case NetworkingFeature
    }
}

public extension ModulePaths {
    
    var name: String {
        switch self {
        case .feature(let feature):
            feature.rawValue
        }
    }
    
    var dependency: TargetDependency {
        switch self {
        case .feature(let feature):
                .project(target: feature.rawValue, path: .relativeToRoot("Projects/Feature/\(feature.rawValue)"))
        }
    }
}
