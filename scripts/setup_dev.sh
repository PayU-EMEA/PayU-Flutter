cd $1
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run dependency_validator
cd ../