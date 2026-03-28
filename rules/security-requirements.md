# Security requirements (Flutter template)

Security expectations for this codebase and for changes agents or contributors make.

## Secrets and configuration

- **Do not commit** API keys, Firebase private keys, signing keystores, or third-party tokens. Use CI secrets and local files excluded by `.gitignore`.
- **Dart defines**: `ENV` in `lib/src/config/env/env.dart` reads `BASE_API_URL`, `SENTRY_DNS`, etc. via `String.fromEnvironment`. Pass values at build time (`--dart-define=KEY=value`), not as hardcoded literals in source.
- **Rotate** any credential that has appeared in git history or public channels.

## Authentication and session data

- Auth tokens are stored via `UserPrefs` / `SharedPreferences`. Treat this as **device-accessible storage**: suitable for many apps, but not equivalent to hardware-backed secure storage. For higher sensitivity, evaluate `flutter_secure_storage` or platform keychains and migrate deliberately.
- Clear tokens on logout and on auth failure paths (`removeTokenApi` / equivalent); avoid leaving stale `Authorization` headers on `XHttp`.
- Validate **session expiry** and **refresh** flows on the server; the client should not trust local clock alone for critical authorization.

## Network

- Use **HTTPS only** for `BASE_API_URL` in production builds.
- Keep timeouts and error handling consistent (`XHttp`); do not disable TLS validation or certificate pinning without a documented threat model.
- **Firebase App Check** is included — enable and configure it for production to reduce abuse of backend/Firebase APIs.

## Logging and error reporting

- **Never log** full tokens, passwords, refresh tokens, or personally identifiable data in plain text.
- Sentry (and similar) should use **environment separation** (dev vs prod DSN/projects) and scrub or filter sensitive fields before upload.

## WebView and external content

- For `webview_flutter` usage under `lib/src/features/common/view/webview/`, restrict navigation and JavaScript interfaces as needed; avoid exposing native bridges to untrusted pages without review.

## Dependencies and supply chain

- Prefer **pinned** or minimum-safe versions in `pubspec.yaml`; run `dart pub outdated` periodically.
- Run **Snyk** (or the project’s mandated scanner) on new or changed first-party code and dependencies; fix reported issues before merge when feasible.

## Client-side validation

- **Formz** and UI validation improve UX but are not security boundaries. Enforce authorization, rate limits, and input validation **on the server**.

## Privacy and platform rules

- Declare data collection accurately for **App Store** and **Play Store** policies (analytics, crash reporting, auth identifiers).
- Request **runtime permissions** only when needed; explain usage to users where the platform requires it.

## Incident response

- If a secret leaks, **revoke** it at the provider, rotate replacements, and audit access logs when available.
