import ProjectDescription
import UtilityPlugin
import ProjectDescriptionHelpers

let project = Project.module(
    .feature(.MiniProgramFeature),
    product: .framework, targets: [
        .makeExampleApp(name: ModulePaths.feature(.MiniProgramFeature).name, dependencies: [
            .target(name: ModulePaths.feature(.MiniProgramFeature).name)
        ])
    ],
    dependencies: [
        ModulePaths.feature(.Assets).dependency,
        ModulePaths.feature(.NetworkingFeature).dependency
    ]
)
