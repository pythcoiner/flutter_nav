import 'package:flutter/material.dart';

import '../bloc.dart';
import '../events/app.dart';
import '../state/app_state.dart';

Widget errorModal(AppError error) {
  AppBloc bloc = AppState.bloc!;
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
          bloc.add(ClearErrorEvent());
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
