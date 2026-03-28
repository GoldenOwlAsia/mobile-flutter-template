# Codegen

Regenerate **injectable**, **freezed**, **json_serializable**, and related outputs after you change annotations, DTOs, or DI registrations.

## Do not hand-edit

- `lib/generated/` — injectable registrations, l10n, `flutter_gen` assets, etc.

## Command

From the project root:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Use `watch` for iterative work if you prefer:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## When to run

- After adding or changing `@injectable` / `@lazySingleton` (or similar) classes.
- After editing `freezed` / `json_serializable` models under `lib/src/network/model/` (or other codegen-backed types).
- After structural changes that affect generated route or serialization code (per your feature).

If the agent introduces such changes, state that codegen was run or should be run before merge.
