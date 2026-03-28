# Security audit

Perform a **security-focused review** of the current scope (selection, open files, branch diff, or feature the user names). Complement static review with tooling where available.

## Baseline documents

- `rules/security-requirements.md` — treat as the checklist for this repo.
- `.cursor/rules/snyk_rules.mdc` — for **new or modified first-party code** in Snyk-supported languages, run the project’s **Snyk code scan** when the tool is available; if findings appear, propose fixes, then **rescan** until clean for the changed surface.

## Areas to examine

1. **Secrets & config** — Hardcoded keys, tokens, DSNs, Firebase files, keystores; misuse of `String.fromEnvironment` / dart-defines.
2. **Auth & session** — Token storage (`UserPrefs` / `SharedPreferences`), logout and header cleanup, refresh/expiry handling, stale `Authorization` on `XHttp`.
3. **Network** — HTTPS for prod, TLS validation, timeouts, error handling; Firebase App Check usage where relevant.
4. **Logging & crash reporting** — No secrets or sensitive PII in logs; Sentry scrubbing / environment separation.
5. **WebView** — If `webview_flutter` is in scope: navigation restrictions, JS bridges, untrusted content.
6. **Dependencies** — Risky or outdated packages in `pubspec.yaml`; supply-chain hygiene.
7. **Client validation** — Remind that UI/`Formz` is not a security boundary; server must enforce rules.

## Output format

1. **Executive summary** — Overall risk (Low / Medium / High) and why.
2. **Findings table** — For each issue: severity, location (file + symbol if possible), problem, exploit / impact scenario, **recommended fix** (concrete).
3. **Positive observations** — Defenses already in place.
4. **Follow-ups** — Tests, monitoring, or policy items that code alone cannot fix.

If the user gave no scope, default to **uncommitted changes** or **recently edited files** and say so.
