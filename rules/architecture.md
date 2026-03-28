# Mobile app architecture (Flutter template)

This document describes how this repository is structured and how new code should fit in.

## High-level stack

- **UI**: Flutter (Material), localized strings via `flutter gen-l10n` under `lib/generated/l10n/`.
- **State**: `flutter_bloc` / `hydrated_bloc` for feature logic; global observers in `lib/src/features/common/app_bloc/`.
- **Navigation**: `go_router`; router and coordinators live under `lib/src/router/`.
- **DI**: `get_it` + `injectable` (generated registration in `lib/generated/injectable/`). Call `configureDependencies()` from `initializeApp` / `_locator()` in `lib/src/locator.dart`.
- **Networking**: `XHttp` (Dio wrapper) in `lib/src/network/data/common/http.dart`; API models use `freezed` + `json_serializable` under `lib/src/network/model/`.
- **Backend integrations**: Firebase (Auth, Firestore, Messaging, Remote Config, Analytics, App Check), optional Sentry.

## Directory layout

| Area | Location | Notes |
|------|-----------|--------|
| App bootstrap | `lib/main.dart`, `lib/src/app.dart`, `lib/src/locator.dart` | Startup, `MultiBlocProvider`, `MaterialApp.router`. |
| Features (screens + blocs/cubits) | `lib/src/features/<feature>/` | Prefer `view/`, `logic/`, `widget/`, `model/` per feature. |
| Shared widgets | `lib/widgets/` | Reusable UI (buttons, forms, state placeholders, app bars). |
| Theme & layout | `lib/src/theme/` | Themes, screen metrics, decorations. |
| Network & data | `lib/src/network/` | `data/` repositories, `model/` DTOs, `blob/` uploads, Firebase helpers. |
| Services | `lib/src/services/` | Cross-cutting: prefs, permissions, remote config, messaging, Sentry. |
| Config & env | `lib/src/config/` | `ENV` (`String.fromEnvironment`), device/app info. |
| Dialogs / toasts | `lib/src/dialogs/` | Wrappers around BotToast and alerts. |
| Utils & extensions | `lib/src/utils/` | Keep thin; no business rules hidden here. |
| Assets & codegen | `lib/generated/` | Injectable, l10n, `flutter_gen` assets — do not hand-edit generated files. |
| Tests | `test/` | Mirror structure; use `bloc_test`, `mocktail`. |

## Feature module pattern

1. **Views** (`*_view.dart`): compose widgets; keep them mostly declarative.
2. **Logic** (`*_bloc.dart`, `*_state.dart`, cubits): events, states, side effects; inject repositories via constructor + `@injectable` where appropriate.
3. **Repositories** (`lib/src/network/data/...`): isolate HTTP/Firestore calls; map DTOs to domain-friendly types if you introduce a domain layer later.
4. **Models**: immutable data classes with `freezed`; run `dart run build_runner build` after changes.

## Routing

- Register routes in `lib/src/router/router.dart` (and related files such as `route_name.dart`, `coordinator.dart`).
- Pass navigation-only data via extras or path/query parameters; avoid storing large objects in route state.

## Cross-cutting concerns

- **Logging**: use the project logger utilities; avoid `print` in production paths.
- **Errors**: centralize HTTP/error handling in `XHttp` / repositories; surface user-visible messages through blocs or UI layers.
- **Persistence**: `UserPrefs` wraps `SharedPreferences` for tokens and light settings; hydrated blocs for larger restorable state — see `initializeApp` in `locator.dart`.

## Conventions for new work

- Prefer **feature-first** folders over a flat `lib/` dump.
- Register new injectable classes with `@injectable` / `@lazySingleton` and regenerate code.
- Keep **widgets dumb** where possible: blocs/cubits own state transitions; repositories own I/O.
- Add or extend **widget tests** under `test/widgets/` and **bloc tests** under `test/blocs/` when behavior is non-trivial.

## Naming

- Follow existing prefixes (`X` for some singletons, `AppRouter`, etc.) when extending the same layer.
- File names: `snake_case.dart`; types: `UpperCamelCase`.
