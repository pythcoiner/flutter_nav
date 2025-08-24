import 'package:flutter/material.dart';
import 'package:stream_sink/controller.dart';

Widget notifBanner(UserNotif notif) {
  final close = ElevatedButton(
    onPressed: () {
      AppController.clearBanner();
    },
    child: Icon(Icons.close),
  );
  return MaterialBanner(
    leading: notif.getIcon(),
    content: Text(notif.msg),
    actions: [close],
  );
}
