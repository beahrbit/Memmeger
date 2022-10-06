# Topics

- Multi-Language-Support: https://docs.flutter.dev/development/accessibility-and-localization/internationalization
  - `flutter gen-l10n`
- Themes: https://flutter.nartawak.dev/workshops/01_punk_api/04_theme_assets.html#theme
- Google Auth with Firebase:
  - for Android: https://www.youtube.com/watch?v=1k-gITZA9CI
- Environment Variables: combination of
  - https://pub.dev/packages/flutter_dotenv/install
  - (only bottom) https://stacksecrets.com/flutter/environment-configuration-in-flutter-app
- API Code Generation: https://pub.dev/packages/swagger_dart_code_generator
  1. build backend 2 times to create a new `swagger.json`
  2. copy `swagger.json` from `backend/MemmegerOneAPI/docs/v1` to `frontend/api/v1`
  3. run `flutter pub run build_runner build` in `frontend` command line

# For Web-Deployment

- To run the flutter web-app the url of the web-app has to be specified in the google cloud
- You can set it on:
  https://console.cloud.google.com/apis/credentials?project=memager-29bb6
  -> Login Data -> OAuth 2.0-Client-IDs -> MemmegerOAuthClient -> Autorised JS-Source
- To run the web-app on a specific port use one of th following commands:
  flutter run -d chrome --web-port 8080
  flutter run -d chrome --web-port 5000
  flutter run -d chrome --web-port 5001
- start a chrome instance with disabled security, run command below, and paste "localhost:8080" into chrome 
- start in the frontend dir
  flutter run -d web-server --web-port 8080
