#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TEST_DIR=$(mktemp -d)

cleanup() {
    rm -rf "$TEST_DIR"
}
trap cleanup EXIT

echo "==> Creating test package in $TEST_DIR"

cat > "$TEST_DIR/Package.swift" << EOF
// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "SPMIntegrationTest",
    platforms: [.iOS(.v15)],
    dependencies: [
        .package(path: "$PACKAGE_DIR")
    ],
    targets: [
        .target(
            name: "SPMIntegrationTest",
            dependencies: [
                .product(name: "UITextView+Placeholder", package: "UITextView-Placeholder")
            ]
        )
    ]
)
EOF

mkdir -p "$TEST_DIR/Sources/SPMIntegrationTest"
cat > "$TEST_DIR/Sources/SPMIntegrationTest/Test.swift" << 'EOF'
import UIKit
import UITextView_Placeholder

@MainActor
public func testPlaceholder() {
    let textView = UITextView()
    textView.placeholder = "Hello, SPM!"
    textView.placeholderColor = .lightGray
}
EOF

echo "==> Resolving dependencies..."
cd "$TEST_DIR"
swift package resolve

echo "==> Building for iOS Simulator..."
SIMULATOR=$(xcrun simctl list devices available | grep -E "iPhone|iPad" | head -1 | sed 's/^[[:space:]]*//' | cut -d'(' -f1 | xargs)
if [ -z "$SIMULATOR" ]; then
    echo "Error: No iOS Simulator found"
    exit 1
fi
echo "    Using simulator: $SIMULATOR"

xcodebuild -scheme SPMIntegrationTest-Package \
    -destination "platform=iOS Simulator,name=$SIMULATOR" \
    build \
    -quiet

echo "==> SPM integration test passed!"
