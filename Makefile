
clean: 
	@echo "$ Cleaning the project"
	@rm -rf pubspec.lock
	@flutter clean && flutter pub get

get:
	flutter pub get

pubUpgrade:
	flutter pub upgrade --major-versions --tighten

format:
	dart format .

lint:
	dart analyze

runner: 
	dart run build_runner build -d

pod:
	pod install --project-directory=ios

podRemove:
	cd ios; rm -rf Podfile.lock; pod deintegrate; pod install; cd ..

signingReport:
	cd android && ./gradlew signingReport && cd ..

genLanguage:
	flutter gen-l10n

BUILD_TIME := $(shell date +"%Y-%m-%d_%H-%M-%S")

DEBUG_INFO_STG_DIR := debug-info/debug-info-staging/$(BUILD_TIME)

buildAndroidStag:
	mkdir -p $(DEBUG_INFO_STG_DIR)
	flutter build appbundle --flavor staging -t lib/main_staging.dart --obfuscate --split-debug-info=$(DEBUG_INFO_STG_DIR) --dart-define-from-file=.env.staging

DEBUG_INFO_PROD_DIR := debug-info/debug-info-prod/$(BUILD_TIME)

buildAndroidProd:
	mkdir -p $(DEBUG_INFO_PROD_DIR)
	flutter build appbundle --flavor production --obfuscate --split-debug-info=$(DEBUG_INFO_PROD_DIR) --dart-define-from-file=.env.production

buildIOSStag:
	flutter build ios --flavor staging -t lib/main_staging.dart --dart-define-from-file=.env.staging

buildIOSProd:
	flutter build ios --flavor production --dart-define-from-file=.env.production

testCoverage:
	flutter test --coverage && lcov -r coverage/lcov.info "lib/generated/*" "lib/packages/*" "lib/src/_dev/*" "lib/src/core/app_bloc/*" "lib/src/core/config" "lib/src/core/router/*" "lib/src/core/resource/*" "lib/src/network/common/*" "lib/src/network/model/*" "lib/src/services/remote_config" "lib/src/core/theme" -o coverage/lcov.info --ignore-errors unused
	
uploadSymbols:
	dart run sentry_dart_plugin --sentry-define=ignore_missing=true

# keytool -list -v -keystore android/app/release-keystore.jks -alias <key alias>
