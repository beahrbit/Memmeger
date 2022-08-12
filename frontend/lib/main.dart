import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/google_sign_in_provider.dart';
import 'package:frontend/screens/events_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/screens/sign_up_screen.dart';
import 'package:frontend/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:frontend/widgets/mem/mem_text.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  // run app
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
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
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;
    final texts = AppLocalizations.of(context)!;

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return const EventsScreen();
          }
          if (snapshot.hasError) {
            return Center(
              child: MemText(
                texts.eventMemberText,
                textThemes.labelMedium!,
              ),
            );
          }
          return const SignUpScreen();
        },
      ),
    );
  }
}
