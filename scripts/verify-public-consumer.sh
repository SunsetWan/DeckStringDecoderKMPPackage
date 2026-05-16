#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CONSUMER_DIR="$REPO_ROOT/Verification/Consumer"

cd "$CONSUMER_DIR"

xcodebuild \
  -scheme DeckStringDecoderPublicConsumer \
  -destination 'platform=iOS Simulator,name=iPhone 17' \
  -derivedDataPath .build/xcode-derived-data \
  test
