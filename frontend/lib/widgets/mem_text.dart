import 'package:flutter/material.dart';

class MemText extends StatelessWidget {
  final String data;

  final Color color;

  final double fontSize;

  final FontWeight fontWeight;

  final TextStyle textStyle;

  final Locale? locale;

  final String? semanticsLabel;

  MemText(
    this.data, {
    Key? key,
    this.color = Colors.black,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.locale,
    this.semanticsLabel,
  })  : textStyle = TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          height: 1,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> parts = split(data);
    return Text.rich(
      TextSpan(children: parts.map((text) => getSpan(text)).toList()),
    );
  }

  List<String> split(String text) {
    final RegExp memPattern = RegExp('mem', caseSensitive: false);
    List<String> parts = data.replaceAll(memPattern, 'memmem').split('mem');
    if (parts[0] == '') parts = parts.sublist(1);
    if (parts[parts.length - 1] == '') parts.sublist(0, parts.length - 1);

    for (int i = 0; i < parts.length; i++) {
      if (parts[i] == '') continue;
      if (i != 0) parts[i] = '-${parts[i]}';
      if (i != parts.length - 1) parts[i] = '${parts[i]}-';
    }
    return parts;
  }

  InlineSpan getSpan(String text) {
    if (text == '') {

      return WidgetSpan(
        baseline: TextBaseline.ideographic,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/mem_small.png',
              height: fontSize * 0.75,
              width: fontSize * 0.75 * 2.5,
              matchTextDirection: true,
            ),
            Container(
              color: Colors.transparent,
              height: fontSize <= 20 ? fontSize / 10 : 0,
              width: fontSize * 0.75 * 2.5,
            ),
          ],
        ),
      );
    } else {
      return TextSpan(
        text: text,
        style: textStyle,
        locale: locale,
        semanticsLabel: semanticsLabel,
      );
    }
  }
}
