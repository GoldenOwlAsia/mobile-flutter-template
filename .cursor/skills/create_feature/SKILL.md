---
name: create-feature
description: >-
  Scaffold a new Flutter feature module with logic (bloc & state), view, and
  widget folders. Use when the user asks to create a new feature, screen, page,
  or module in the app.
---

# Create Feature

Scaffold a new feature under `lib/src/features/<feature_name>/` following this
project's conventions.

## Prerequisites

- Read `rules/architecture.md` if you need a refresher on the project layout.
- The feature name must be **snake_case** (e.g. `order_history`).

## Folder structure to create

```
lib/src/features/<feature_name>/
├── logic/
│   ├── <feature_name>_bloc.dart
│   └── <feature_name>_state.dart
├── view/
│   └── <feature_name>_view.dart
└── widget/
    └── (empty – ready for extracted widgets)
```

## Step-by-step

1. **Ask** (if not already clear): feature name and a one-line purpose.
2. **Create files** using the templates below.
3. **Register the route** — add a `RouteName` constant and a `GoRoute` entry
   in `lib/src/router/route_name.dart` and `lib/src/router/router.dart`, plus a
   coordinator method in `lib/src/router/coordinator.dart`.
4. **Register DI** — if the bloc depends on repositories, annotate with
   `@injectable`; for app-wide singletons use `@lazySingleton`. Then run
   `dart run build_runner build --delete-conflicting-outputs`.
5. **Verify** — run `flutter analyze` to confirm no errors.

## Templates

### `<feature_name>_state.dart`

```dart
part of '<feature_name>_bloc.dart';

class <FeatureName>State extends Equatable {
  const <FeatureName>State();

  @override
  List<Object?> get props => [];

  <FeatureName>State copyWith() {
    return const <FeatureName>State();
  }
}
```

### `<feature_name>_bloc.dart`

```dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part '<feature_name>_state.dart';

@injectable
class <FeatureName>Bloc extends Cubit<<FeatureName>State> {
  <FeatureName>Bloc() : super(const <FeatureName>State());
}
```

### `<feature_name>_view.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/generated/injectable/injection.dart';
import 'package:myapp/src/features/<feature_name>/logic/<feature_name>_bloc.dart';

class <FeatureName>View extends StatelessWidget {
  const <FeatureName>View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<<FeatureName>Bloc>(),
      child: BlocBuilder<<FeatureName>Bloc, <FeatureName>State>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('<Feature Name>')),
            body: const Center(
              child: Text('<Feature Name>'),
            ),
          );
        },
      ),
    );
  }
}
```

## Naming conventions

| Placeholder | Rule | Example (`order_history`) |
|---|---|---|
| `<feature_name>` | snake_case | `order_history` |
| `<FeatureName>` | UpperCamelCase | `OrderHistory` |
| `<Feature Name>` | Title for display | `Order History` |

## Notes

- State uses `part of` / `part` to colocate with the bloc file (project convention).
- Always extend `Equatable` for states so `BlocBuilder` rebuilds correctly.
- Provide `copyWith` on state from the start — it is always needed later.
- The `widget/` folder starts empty; extract widgets from the view as complexity grows.
- For blocs that need repositories, inject them via constructor and add the corresponding `DomainManager` or repository parameter.
