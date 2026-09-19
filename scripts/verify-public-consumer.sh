#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CONSUMER_DIR="$REPO_ROOT/Verification/Consumer"
IOS_SIMULATOR_DESTINATION="${IOS_SIMULATOR_DESTINATION:-platform=iOS Simulator,name=iPhone 17}"

cd "$CONSUMER_DIR"

test "$(xcsift --version)" = "1.3.2-sunset.2"
xcodebuild \
  -scheme DeckStringDecoderPublicConsumer \
  -destination "$IOS_SIMULATOR_DESTINATION" \
  -derivedDataPath .build/xcode-derived-data \
  test 2>&1 | xcsift --exit-on-failure
