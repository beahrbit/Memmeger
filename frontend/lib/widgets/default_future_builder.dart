import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:frontend/screens/events_screen.dart';
import 'package:frontend/screens/sign_up_screen.dart';

import 'mem/mem_text.dart';

typedef DefaultAsyncWidgetBuilder<T> = Widget Function(
    BuildContext context, T data);

class DefaultFutureBuilder<T> extends StatelessWidget {
  final Future<Response<T>> future;
  final DefaultAsyncWidgetBuilder<T> builder;
  final String errorMessage;
  final Widget? noData;

  const DefaultFutureBuilder(
      {required this.future,
      required this.builder,
      required this.errorMessage,
      this.noData,
      Key? key})
      : super(key: key);

  void onHome(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EventsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;
    final texts = AppLocalizations.of(context)!;

    return FutureBuilder<Response<T>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MemText(
                    errorMessage,
                    textThemes.labelMedium!,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: MemText(
                      texts.onReturnHome,
                      textThemes.button!,
                    ),
                    onPressed: () => onHome(context),
                  ),
                ],
              ),
            ),
          );
        }
        if (!snapshot.hasData && noData != null) {
          return noData!;
        }
        final response = snapshot.requireData;
        if (!response.isSuccessful) {
          return noData!;
        }
        final data = response.body;
        if (data == null) {
          return noData!;
        }
        return builder(context, data);
      },
    );
  }
}
