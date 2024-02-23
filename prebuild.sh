cd packages

cd features
#find . -mindepth 1 -maxdepth 1 -type d -exec sh -c 'cd "$0" && echo "$0" && flutter pub run build_runner build --delete-conflicting-outputs' {} \;

cd ../navigation
flutter pub run build_runner build --delete-conflicting-outputs

# read -r -p "Press Enter to continue..." key