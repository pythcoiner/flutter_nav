import 'package:flutter/material.dart';

import '../controller.dart';

Widget errorModal(AppError error) {
  return AlertDialog(
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [Text(error.msg)],
    ),
    elevation: 16.0,
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      ElevatedButton(
        onPressed: () {
          AppController.clearError();
        },
        child: Text("Close"),
      ),
    ],
  );
}

Widget shadowed(Widget content) {
  return IgnorePointer(
    child: ColorFiltered(
      colorFilter: ColorFilter.mode(
        // ignore: deprecated_member_use
        Colors.black.withOpacity(0.4),
        BlendMode.srcATop,
      ),
      child: content,
    ),
  );
}
