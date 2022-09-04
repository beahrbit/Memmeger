import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScannerDialog extends StatelessWidget {
  const QrCodeScannerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, args) {
          if (barcode.rawValue == null) return;

          final String code = barcode.rawValue!;
          Navigator.pop(context, code);
        },
      ),
    );
  }
}
