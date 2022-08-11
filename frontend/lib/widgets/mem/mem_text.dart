import 'package:flutter/material.dart';

class MemText extends StatelessWidget {
  final String data;

  final TextStyle style;

  final double fontSize;

  MemText(
    this.data,
    TextStyle textStyle, {
    Key? key,
  })  : style = textStyle.copyWith(height: 1),
        fontSize = textStyle.fontSize ?? 14,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> parts = split(data);
    return Text.rich(
      TextSpan(children: parts.map(getSpan).toList()),
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
              color: style.color,
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
        style: style,
      );
    }
  }
}
