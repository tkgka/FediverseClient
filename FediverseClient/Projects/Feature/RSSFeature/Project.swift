import ProjectDescription
import UtilityPlugin
import ProjectDescriptionHelpers

let project = Project.module(
    .feature(.RSSFeature),
    product: .framework, targets: [
        .makeExampleApp(name: ModulePaths.feature(.RSSFeature).name, dependencies: [
            .target(name: ModulePaths.feature(.RSSFeature).name)
        ])
],
    dependencies: [
        ModulePaths.feature(.UIComponent).dependency,
        ModulePaths.feature(.NetworkingFeature).dependency
    ]
)
