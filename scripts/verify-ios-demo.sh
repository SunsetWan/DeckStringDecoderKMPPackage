#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
IOS_SIMULATOR_DESTINATION="${IOS_SIMULATOR_DESTINATION:-platform=iOS Simulator,name=iPhone 17}"

xcodebuild \
  -project "$REPO_ROOT/DeckStringDecoderKMPDemo/DeckStringDecoderKMPDemo.xcodeproj" \
  -scheme DeckStringDecoderKMPDemo \
  -destination "$IOS_SIMULATOR_DESTINATION" \
  -derivedDataPath "$REPO_ROOT/DeckStringDecoderKMPDemo/.build/xcode-derived-data" \
  test
