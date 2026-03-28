# Implement

Implement the requested change **end-to-end** in this Flutter repo, following existing patterns.

## Before coding

- If requirements are still ambiguous, ask **one** short round of clarifications or apply the smallest reasonable default and state it.
- Read nearby files first; match naming, imports, and structure already used in the same feature or layer.

## Architecture (must follow)

See `rules/architecture.md`:

- **Feature-first** layout under `lib/src/features/<feature>/` with `view/`, `logic/`, `widget/`, `model/` as appropriate.
- **State**: `flutter_bloc` / `hydrated_bloc`; provide blocs via `MultiBlocProvider` / existing app wiring.
- **Navigation**: `go_router` — register routes under `lib/src/router/`.
- **DI**: `get_it` + `injectable`; annotate new classes; run codegen when registrations or freezed/json change.
- **Networking**: use `XHttp` and repository pattern; DTOs with `freezed` + `json_serializable` under `lib/src/network/model/`.
- **Do not** hand-edit `lib/generated/` (injectable, l10n, flutter_gen).

## Implementation standards

- Keep diffs **focused** on the task; no drive-by refactors or unrelated formatting.
- Prefer **reusing** existing widgets, extensions, and repositories.
- Add **tests** when behavior is non-trivial (bloc tests, widget tests under `test/`).
- Run `dart analyze` / `flutter test` on affected areas if you have shell access; fix new issues you introduce.

## Security

Follow `rules/security-requirements.md`: no secrets in repo, no logging tokens/PII, production API over HTTPS, respect App Check / Sentry conventions.

## When done

- Briefly list **files touched** and **how to verify** (manual steps or tests run).
- If codegen is required, state the exact command (e.g. `dart run build_runner build --delete-conflicting-outputs`).
