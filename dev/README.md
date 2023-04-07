# Developers Process

## How to implement bugfix/feature?

### Step 1

Create branch for feature, bugfix, etc. from `main` branch:

* for ex.: `feature/92-add-new-payment-method-support`
* for ex.: `bugfix/114-the-placeholder-for-card-cvv-is-incorrect`

### Step 2

Set the correct `pubspec.yaml` dependencies:

1. Change dependencies source in `{Package}/pubspec.yaml` for all Packages from `git` to `path`:

For example: 

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

1. Change dependencies source in `{Package}/pubspec.yaml` for all Packages from `path` to `git`

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
