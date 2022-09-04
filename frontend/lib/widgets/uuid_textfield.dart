import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/widgets/qr_code_scanner_dialog.dart';

class UuidTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const UuidTextField(
      {Key? key, required this.controller, this.hintText = 'Enter UUID'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: _getScanButton(context),
      ),
    );
  }

  Widget? _getScanButton(BuildContext context) {
    if (defaultTargetPlatform != TargetPlatform.android &&
        defaultTargetPlatform != TargetPlatform.iOS) {
      return null;
    }
    if (controller.text.isNotEmpty) {
      return null;
    }

    return IconButton(
      onPressed: () => _scanQrCode(context),
      icon: const Icon(Icons.qr_code_scanner_outlined),
    );
  }

  _scanQrCode(BuildContext context) async {
    String? eventId = await showDialog(
      context: context,
      builder: (context) => const QrCodeScannerDialog(),
    );
    controller.text = eventId ?? '';
  }
}
