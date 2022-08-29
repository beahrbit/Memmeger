# Topics

- Multi-Language-Support: https://docs.flutter.dev/development/accessibility-and-localization/internationalization
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
