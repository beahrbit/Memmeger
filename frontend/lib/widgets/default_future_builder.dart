import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'mem/mem_text.dart';

typedef DefaultAsyncWidgetBuilder<T> = Widget Function(
    BuildContext context, T data);

class DefaultFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
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

  @override
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;

    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: MemText(
              errorMessage,
              textThemes.labelMedium!,
            ),
          );
        }
        if (!snapshot.hasData && noData != null) {
          return noData!;
        }
        return builder(context, snapshot.requireData);
      },
    );
  }
}
