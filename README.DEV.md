# Developers Process
- Java 17
- Download Flutter https://docs.flutter.dev/install/archive (Min and tested version is 3.22.2 with Dart 3.4.4)
- Add Flutter SDK bin path to `$PATH`
- Add Java 17 to Flutter `flutter config --jdk-dir=/path/to/java17/jdk`
- Add Flutter SDK path to Flutter configuration in Android Studio

## Make script
- `make clean`: Run `flutter clean` for all Packages
- `make setup`: Run `flutter pub get` for all Packages
- `make setup_dev`: Run `flutter pub get && flutter pub upgrade && flutter pub run dependency_validator` for all Packages and validates dependencies
- `make build`: Run `flutter pub run build_runner build` for all Packages
- `make to_local`: Switch PayU dependencies to local
- `make to_git`: Switch PayU dependencies to git
- `make tests`: Run tests for all Packages

## How build SDK and run example project
- `make to_local` - if you want to use local PayU dependencies
- `make clean` - clean project
- `make setup` - get dependencies
- Create `local.properties` file in `example/android` directory with content
```properties
sdk.dir=/path/to/android/sdk
flutter.sdk=/path/to/flutter/sdk
```
- Dart entrypoint for Flutter Run configuration is `example/lib/main.dart`
- Select Device (Android or iOS) and `Run`

## How to implement bugfix/feature?

### Step 1

Create branch for feature, bugfix, etc. from `main` branch:

* for ex.: `feature/92-add-new-payment-method-support`
* for ex.: `bugfix/114-the-placeholder-for-card-cvv-is-incorrect`

### Step 2

Set to local dependencies in `pubspec.yaml`: `make to_local`

### Step 3

Make changes:

1. Make changes in `{Package}/lib/src/` folder for package
2. Update `example` app (optional)
3. Run `example` app (optional)
4. Push changes to your branch

### Step 4

Update tests:

1. Update tests in `{Package}/test` folder
2. Run tests in `{Package}/test` folder
3. Push changes to your branch

### Step 5

Update documentation:

1. Update documentation in `{Package}/README.md` (optional)
2. Update documentation in `README.md` (optional)
3. Push changes to your branch

## How to prepare for Release?

### Step 1

Set the correct `pubspec.yaml` dependencies:

1. Set to git dependencies in `pubspec.yaml`: `make to_git`


### Step 2

Ensure all tests passed:

1. Run `make setup` command in `Terminal` from the project root folder
2. Run `make tests` command in `Terminal` from the project root folder
3. Push changes to your branch

### Step 3

Update documentation according to new version:

1. Update `README.md` in the project root folder
2. Update `Changelog.md` in the project root folder
3. Push changes to your branch

## How to make release?

### Step 1

1. Make pull request into `main` branch from your branch
2. Merge your branch into `main` branch
3. Push `tag` with new version to `main` branch
