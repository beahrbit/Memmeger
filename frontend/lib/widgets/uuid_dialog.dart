import 'package:flutter/material.dart';
import 'package:frontend/widgets/mem/mem_text.dart';
import 'package:frontend/widgets/uuid_textfield.dart';

class UuidDialog extends StatefulWidget {
  final String headline;
  final String? description;
  final String okButtonText;

  const UuidDialog(
      {Key? key,
      required this.headline,
      required this.okButtonText,
      this.description})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _UuidDialogState();
}

class _UuidDialogState extends State<UuidDialog> {
  final tfController = TextEditingController();

  bool _buttonEnabled = false;

  @override
  void initState() {
    super.initState();
    tfController.addListener(() {
      setState(() {
        _buttonEnabled = tfController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          // color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MemText(widget.headline, textTheme.titleLarge!),
            const SizedBox(
              height: 8,
            ),
            MemText(widget.description ?? '', textTheme.bodyMedium!),
            const SizedBox(height: 22),
            UuidTextField(controller: tfController),
            const SizedBox(
              height: 22,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: _buttonEnabled ? _enterEvent : null,
                child: Text(
                  widget.okButtonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _enterEvent() {
    final uuid = tfController.text;
    Navigator.pop(context, uuid);
  }
}
