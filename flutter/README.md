# $name

A New Flutter Project

## Features

## Getting started

To run the application

```bash
flutter run --dart-define=fastDebug=true
```

To update dependencies

```bash
flutter pub upgrade --parallel --major-versions
```

## Running Tests

### Test Coverage

The package utilizes flutter test to run tests.

```bash
flutter test --coverage
coverde report
```

### Generate Design System

The package utilizes goldens to generate design system.

```bash
flutter test --update-goldens --tags=golden
```

## Generating Dependencies

The package utilizes injectable package for DI:
To generate new dependencies:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Usage

### Generate Release APK

To generate the release apk, run the following command:

```bash
flutter build apk --release --obfuscate --split-debug-info=debug-info/ --tree-shake-icons
```
