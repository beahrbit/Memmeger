import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/providers/google_sign_in_provider.dart';
import 'package:frontend/providers/memmeger_api_provider.dart';
import 'package:frontend/screens/events_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  // environment variables
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'DEV',
  );
  await dotenv.load(fileName: ".env/$environment.env");

  // firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // makes dev easier
  if (environment.contains('DEV')) {
    HttpOverrides.global = MyHttpOverrides();
  }

  // run app
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => MemmegerApiProvider()),
      ],
      child: MaterialApp(
        title: 'App',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('de', ''),
        ],
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,

        // has to be a user screen, to assure that the user is logged in
        home: const EventsScreen(),
      ),
    );
  }
}
