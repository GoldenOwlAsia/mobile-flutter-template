
clean: 
	@echo "$ Cleaning the project"
	@rm -rf pubspec.lock
	@flutter clean && flutter pub get

get:
	flutter pub get

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
	
# keytool -list -v -keystore android/app/release-keystore.jks -alias <key alias>
