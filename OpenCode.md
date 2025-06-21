# OpenCode.md for flutter_rpg

## Build, Lint, and Test Commands
- **Build the app:**
  - `flutter build <platform>` (e.g., `flutter build apk` or `flutter build web`)
- **Run the app:**
  - `flutter run`
- **Static analysis (lint):**
  - `flutter analyze`
- **Run all tests:**
  - `flutter test`
- **Run a single test file:**
  - `flutter test <path/to/test_file.dart>`

## Code Style Guidelines
- **Imports:**
  - Use package imports; group dart/flutter, then package, then local imports; use single quotes (`'`) as per lint settings.
- **Formatting:**
  - Use `dart format .` for code formatting.
  - Always use curly braces in flow control (`if`, `for`, `while`).
- **Types:**
  - Use explicit types and `final` for locals where possible. Avoid `dynamic` and unchecked types.
- **Naming:**
  - Use lowerCamelCase for variables/methods, UpperCamelCase for types/classes, and UPPER_SNAKE_CASE for constants.
- **Error Handling:**
  - Do not use bare `print`; prefer logging packages. Always return a value for non-void functions.
- **Lints/Analysis:**
  - Strict analysis: missing returns are errors; see `analysis_options.yaml` for enforced Flutter/Dart best practices.
- **Widgets:**
  - Widgets with constructors should use keys (`use_key_in_widget_constructors: true`).
- **Other:**
  - Prefer final/const as much as possible; avoid empty `else` blocks.
  - Prefer child property last in widget constructors.

See `analysis_options.yaml` and `pubspec.yaml` for dependency/linter details.
