# Code review

Review the **current selection, open files, or recent diff** against this project’s standards. Be direct and actionable.

## Context to honor

- Architecture and layering: see `rules/architecture.md` (feature folders, BLoC/cubit, repositories, `go_router`, `get_it` / `injectable`, no hand-editing `lib/generated/`).
- Security expectations: see `rules/security-requirements.md`.

## What to produce

1. **Summary** — One short paragraph: what changed and whether it fits the architecture.
2. **Strengths** — What is done well (specific references to files/symbols).
3. **Issues** — Grouped by severity:
   - **Blockers** — correctness bugs, security leaks, broken contracts, or clear violations of project rules.
   - **Should fix** — maintainability, missing tests for non-trivial behavior, inconsistent patterns.
   - **Nits** — naming, small style, optional polish.
4. **Concrete fixes** — For each non-nit issue: file path, what to change, and a minimal code-level suggestion when helpful.

## Review checklist (Flutter template)

- **UI vs logic**: Views stay declarative; state transitions live in blocs/cubits; I/O in repositories / `XHttp`, not in widgets.
- **DI**: New services use `@injectable` / `@lazySingleton` and codegen; dependencies wired through constructors.
- **Routing**: Changes use `go_router` patterns under `lib/src/router/`; no huge objects in route state.
- **Models**: `freezed` + serialization; remind to run `build_runner` when DTOs change.
- **Tests**: Non-trivial logic should have bloc/widget tests under `test/` mirroring structure.
- **Security**: No secrets in source; tokens not logged; HTTPS for prod API; App Check / Sentry usage consistent with `rules/security-requirements.md`.

If scope is unclear, state your assumptions and review what you can see.
