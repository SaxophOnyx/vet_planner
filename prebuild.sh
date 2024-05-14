cd packages

cd core
dart run easy_localization:generate -f keys -S resources/langs -O lib/src/localization/generated -o locale_keys.g.dart

cd ../features
find . -mindepth 1 -maxdepth 1 -type d -exec sh -c 'cd "$0" && echo "$0" && dart run build_runner build --delete-conflicting-outputs' {} \;

cd ../navigation
dart run build_runner build --delete-conflicting-outputs

# read -r -p "Press Enter to continue..." key