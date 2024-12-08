import ProjectDescription
import UtilityPlugin
import ProjectDescriptionHelpers

let project = Project.module(
    .feature(.XMPPFeature),
    product: .framework, targets: [
        .makeExampleApp(name: ModulePaths.feature(.XMPPFeature).name, dependencies: [
            .target(name: ModulePaths.feature(.XMPPFeature).name)
        ])
],
    dependencies: [
        ModulePaths.feature(.UIComponent).dependency,
        ModulePaths.feature(.NetworkingFeature).dependency
    ]
)
