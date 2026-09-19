# Portable Codec: Local Verification

Observed on 2026-09-19 before publication: local candidate only. This record is
historical evidence, not the current release status.

`Sources` and `Tests` are generated from the canonical `swiftpm-binary` directory
in `SunsetWan/DeckStringDecoderKMP`. Edit them there and use its release-preparation
script to update this distribution. The local manifest uses an ignored runtime
archive under `Artifacts`; publication replaces that path with a remote URL and
checksum. The existing README describes the earlier published package.

Products:

- `DeckStringModels`: portable Swift values and errors, with preserved JSON and
  ordering behavior.
- `DeckStringDecoder`: iOS source facade; public aliases refer to the model product.
- `DeckStringRuntime`: iOS Kotlin bridge binary, without the bundled Swift facade.

Consumers must rebuild because model module identity changes. This is not an
ABI-compatible binary replacement. Swift language mode remains 5; the manifest
requires tools 6.2. Minimum platforms are iOS 15 and macOS 14 for the model product.

Local checks passed: macOS model tests (5), iOS contract tests (8), independent
consumer tests (2), and BobNote tests (129). Failure and skip counts are zero.
BobNote Release simulator compilation also passed. Full BobNote feature-package
extraction, UI acceptance, public download, and remote consumer checks remain pending.

Proposed release: `0.1.0-kmp.6`. The runtime checksum is:

```text
a0ece886f9bf135302103bef30c5568fba0f42a18809a76dfdbece7013b847e7
```

No commit, push, tag, or release was performed. Existing Xcode user files and
`.DS_Store` files were preserved.
