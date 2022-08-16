import 'package:flutter/material.dart';

class MemLogo extends StatelessWidget {
  final double width;

  const MemLogo(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final imgName = dark ? 'mem_dark_trans.png' : 'mem_light_trans.png';
    final imgPath = 'assets/images/$imgName';
    return Image.asset(
      imgPath,
      width: width,
    );
  }
}
