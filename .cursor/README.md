# Cursor AI configuration

This folder configures [Cursor](https://cursor.com) for this Flutter template: **rules** (automatic context), **slash commands** (repeatable workflows), and a bundled **skill** (optional deep checklist).

## Rules (`.cursor/rules/`)

| File | When it applies |
|------|------------------|
| `project-context.mdc` | Always — where canonical docs and commands live |
| `snyk_rules.mdc` | Always — Snyk scan/fix/rescan for new or changed first-party code where supported |
| `flutter-architecture.mdc` | When editing files under `lib/**/*.dart` — stack, layers, codegen boundaries |

Full architecture write-up: [`rules/architecture.md`](../rules/architecture.md). Security: [`rules/security-requirements.md`](../rules/security-requirements.md).

## Slash commands (`.cursor/commands/`)

| Command | Use it to |
|---------|-----------|
| **Implement** | Ship a feature or fix end-to-end using this repo’s patterns |
| **Review** | Review selection/diff against architecture and quality |
| **Clarify** | Narrow requirements before implementation (no production code) |
| **Security audit** | Security-focused pass over scope + Snyk when applicable |
| **Codegen** | Know when and how to run `build_runner` for this project |
| **Analyze** | Run analyzer/tests on touched areas and fix new issues |

Invoke from the chat input with `/` and the command name (e.g. `/implement`).

## Skills (`.cursor/skills/`)

- **`flutter-dart-code-review`** — Library-agnostic Flutter/Dart review checklist (widgets, state management families, performance, a11y, security). Use when you want a thorough review beyond this template’s defaults.

## Root helper

[`AGENTS.md`](../AGENTS.md) at the repo root gives a short, copy-friendly summary for any agent or contributor.
