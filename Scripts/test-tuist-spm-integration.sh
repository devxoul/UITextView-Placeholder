#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TEST_DIR=$(mktemp -d)

cleanup() {
    rm -rf "$TEST_DIR"
}
trap cleanup EXIT

echo "==> Creating Tuist+SPM test project in $TEST_DIR"

cat > "$TEST_DIR/Tuist.swift" << 'EOF'
import ProjectDescription

let tuist = Tuist()
EOF

cat > "$TEST_DIR/Package.swift" << EOF
// swift-tools-version:6.0
import PackageDescription

#if TUIST
import ProjectDescription

let packageSettings = PackageSettings(
    baseSettings: .settings()
)
#endif

let package = Package(
    name: "TuistSPMTest",
    dependencies: [
        .package(path: "$PACKAGE_DIR")
    ]
)
EOF

cat > "$TEST_DIR/Project.swift" << 'EOF'
import ProjectDescription

let project = Project(
    name: "TuistSPMTest",
    targets: [
        .target(
            name: "TuistSPMTest",
            destinations: .iOS,
            product: .app,
            bundleId: "com.test.TuistSPMTest",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "UITextView-Placeholder")
            ]
        )
    ]
)
EOF

mkdir -p "$TEST_DIR/Sources"
cat > "$TEST_DIR/Sources/App.swift" << 'EOF'
import UIKit
import UITextView_Placeholder

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let textView = UITextView()
        textView.placeholder = "Hello, Tuist+SPM!"
        return true
    }
}
EOF

echo "==> Installing external dependencies with Tuist..."
cd "$TEST_DIR"
tuist install

echo "==> Generating Xcode project with Tuist..."
tuist generate --no-open

echo "==> Building with xcodebuild..."
SIMULATOR=$(xcrun simctl list devices available | grep -E "iPhone" | head -1 | sed 's/^[[:space:]]*//' | cut -d'(' -f1 | xargs)
if [ -z "$SIMULATOR" ]; then
    echo "Error: No iOS Simulator found"
    exit 1
fi
echo "    Using simulator: $SIMULATOR"

xcodebuild -workspace TuistSPMTest.xcworkspace \
    -scheme TuistSPMTest \
    -destination "platform=iOS Simulator,name=$SIMULATOR" \
    build \
    -quiet

echo "==> Tuist+SPM integration test passed!"
