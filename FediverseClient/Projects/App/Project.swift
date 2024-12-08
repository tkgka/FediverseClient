import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin
import EnvPlugin

let targets: [Target] = [
    .makeApp(name: ProjectInfo.name, dependencies: [
        ModulePaths.feature(.NetworkingFeature).dependency
    ])
].addTest()

let project = Project(
    name: ProjectInfo.name,
    settings: ProjectInfo.settings,
    targets: targets,
    schemes: ProjectInfo.schemes
)
