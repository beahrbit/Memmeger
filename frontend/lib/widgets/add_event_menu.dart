import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:frontend/model/swagger.models.swagger.dart';
import 'package:frontend/providers/google_sign_in_provider.dart';
import 'package:frontend/providers/memmeger_api_provider.dart';
import 'package:frontend/widgets/uuid_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../screens/event_screen.dart';

class AddEventMenu extends StatefulWidget {
  const AddEventMenu({Key? key}) : super(key: key);

  @override
  State<AddEventMenu> createState() => _AddEventMenuState();
}

class _AddEventMenuState extends State<AddEventMenu> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;

    return SpeedDial(
      onPress: () {
        if (!isDialOpen.value) {
          isDialOpen.value = true;
          return;
        }
        // TODO: open scrren to create event
      },
      openCloseDial: isDialOpen,
      icon: Icons.add,
      activeIcon: Icons.add,
      closeManually: false,
      isOpenOnStart: false,
      childrenButtonSize: const Size(64, 64),
      spaceBetweenChildren: 4,
      useRotationAnimation: false,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.login_outlined),
          label: texts.enterEvent,
          onTap: () => _openUuidDialog(context),
        ),
      ],
    );
  }

  void _openUuidDialog(context) async {
    final texts = AppLocalizations.of(context)!;

    String? eventId = await showDialog(
      context: context,
      builder: (context) => UuidDialog(
        headline: texts.enterEvent,
        description: texts.enterEventDialogDescription,
        okButtonText: texts.enterEvent,
      ),
    );

    if (eventId == null) return;

    final client =
        Provider.of<MemmegerApiProvider>(context, listen: false).client;
    final provider = Provider.of<UserProvider>(context, listen: false);
    final user = provider.user!;

    print(user.userId);
    print(eventId);
    final res = await client.apiMembershipPost(
      body: Member(
        eventId: eventId,
        userId: user.userId,
        invitationState: 'unknown',
        role: 'guest',
      ),
    );
    if (!res.isSuccessful) {
      print(res.error);
      print(res.body);
      print(res.statusCode);
      print(res.headers);
      final snackbarContext = ScaffoldMessenger.of(context);
      snackbarContext
          .showSnackBar(SnackBar(content: Text(texts.eventNotFound)));
      return;
    }

    final event = res.body!;
    print(event);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EventScreen(event)),
    );
  }
}
