import ProjectDescription

let project = Project(
    name: "UITextView+Placeholder",
    targets: [
        // MARK: - Framework
        .target(
            name: "UITextView_Placeholder",
            destinations: .iOS,
            product: .framework,
            bundleId: "kr.xoul.UITextView-Placeholder",
            deploymentTargets: .iOS("12.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            headers: .headers(
                public: ["Sources/UITextView+Placeholder.h"]
            ),
            settings: .settings(
                base: [
                    "DEFINES_MODULE": "YES",
                    "MODULEMAP_FILE": "$(SRCROOT)/Sources/module.modulemap",
                    "PRODUCT_MODULE_NAME": "UITextView_Placeholder",
                    "HEADER_SEARCH_PATHS": "$(SRCROOT)/Sources",
                ]
            )
        ),

        // MARK: - Demo App
        .target(
            name: "Demo",
            destinations: .iOS,
            product: .app,
            bundleId: "kr.xoul.Demo",
            deploymentTargets: .iOS("12.0"),
            infoPlist: .extendingDefault(with: [
                "UIMainStoryboardFile": "Main",
                "UILaunchStoryboardName": "LaunchScreen",
            ]),
            sources: ["Demo/**"],
            resources: [
                "Demo/Base.lproj/**",
                "Demo/Assets.xcassets",
            ],
            dependencies: [
                .target(name: "UITextView_Placeholder"),
            ],

        ),

        // MARK: - Tests
        .target(
            name: "Tests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "kr.xoul.Tests",
            deploymentTargets: .iOS("12.0"),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "UITextView_Placeholder"),
            ]
        ),
    ],
    schemes: [
        .scheme(
            name: "Demo",
            shared: true,
            buildAction: .buildAction(targets: ["Demo"]),
            runAction: .runAction(configuration: .debug, executable: "Demo")
        ),
        .scheme(
            name: "Tests",
            shared: true,
            buildAction: .buildAction(targets: ["Tests"]),
            testAction: .targets(["Tests"])
        ),
    ]
)
