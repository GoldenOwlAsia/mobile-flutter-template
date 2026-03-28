# Agent instructions (Flutter mobile template)

This repo is a Flutter app template. Prefer **project docs** and **Cursor commands** over guessing stack choices.

## Canonical docs

- **Architecture & folders**: [`rules/architecture.md`](rules/architecture.md) — feature-first `lib/src/features/`, BLoC/cubit, `go_router`, `get_it` / `injectable`, `XHttp`, `freezed`, no hand-edits under `lib/generated/`.
- **Security**: [`rules/security-requirements.md`](rules/security-requirements.md) — secrets, tokens, HTTPS, logging, App Check / Sentry expectations.

## Cursor (if available)

- **Rules**: `.cursor/rules/` — always-on project context + Snyk expectations; Dart files under `lib/` also get `flutter-architecture.mdc`.
- **Slash commands**: `.cursor/commands/` — e.g. **Implement** for feature work, **Review** / **Security audit** for checks, **Clarify** before ambiguous work, **Codegen** / **Analyze** for tooling.
- **Details**: [`.cursor/README.md`](.cursor/README.md).

## Security tooling

For new or modified first-party code in Snyk-supported languages, run **Snyk code scan** when the tool is available; fix findings and rescan until the changed surface is clean (see `.cursor/rules/snyk_rules.mdc`).
