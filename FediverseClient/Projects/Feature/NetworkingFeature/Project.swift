import ProjectDescription
import UtilityPlugin
import ProjectDescriptionHelpers

let project = Project.module(
    .feature(.NetworkingFeature),
    product: .framework, targets: [],
    dependencies: [
        .external(name: "Alamofire")
    ]
)
