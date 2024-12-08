import ProjectDescription
import UtilityPlugin
import ProjectDescriptionHelpers

let project = Project.module(
    .feature(.GameFeature),
    product: .framework, targets: [
        .makeExampleApp(name: ModulePaths.feature(.GameFeature).name, dependencies: [
            .target(name: ModulePaths.feature(.GameFeature).name)
        ])
    ],
    dependencies: [
        ModulePaths.feature(.UIComponent).dependency,
        ModulePaths.feature(.Assets).dependency,
        ModulePaths.feature(.NetworkingFeature).dependency
    ]
)
