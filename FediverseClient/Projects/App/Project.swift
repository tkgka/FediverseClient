import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin
import EnvPlugin

let targets: [Target] = [
    .makeApp(name: ProjectInfo.name, dependencies: [
        ModulePaths.feature(.GameFeature).dependency,
        ModulePaths.feature(.MiniProgramFeature).dependency,
        ModulePaths.feature(.XMPPFeature).dependency,
        ModulePaths.feature(.RSSFeature).dependency,
        ModulePaths.feature(.FediverseFeature).dependency
    ])
].addTest()

let project = Project(
    name: ProjectInfo.name,
    settings: ProjectInfo.settings,
    targets: targets,
    schemes: ProjectInfo.schemes
)
