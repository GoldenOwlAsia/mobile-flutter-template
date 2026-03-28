# Analyze and test

Run static analysis and tests on the **areas you changed** (or the whole project if scope is unclear). Fix any **new** issues you introduced; do not expand scope to pre-existing unrelated warnings unless asked.

## Analyze

From the project root:

```bash
dart analyze
```

Or:

```bash
flutter analyze
```

## Tests

Targeted (example — replace with touched paths):

```bash
flutter test test/path/to/relevant_test.dart
```

Full suite when appropriate:

```bash
flutter test
```

## Output

Summarize: analyzer result (clean vs issues), tests run and pass/fail, and what you fixed. If failures are outside your diff, note them without “fixing the world” unless the user wants that.
