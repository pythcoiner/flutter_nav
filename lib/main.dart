import 'package:flutter/material.dart';

import 'controller.dart';
import 'routes.dart';
import 'src/rust/api/interface.dart';
import 'src/rust/frb_generated.dart';

import 'widgets/modal.dart';

Future<void> main() async {
  await RustLib.init();
  RController.init();
  AppController.listenController();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var sb = StreamBuilder(
      stream: AppController.I.uiStream(),
      builder: (_, _) {
        final Widget screen = router();
        if (AppController.I.modal == null) {
          return screen;
        } else {
          return Stack(children: [shadowed(screen), AppController.I.modal!]);
        }
      },
    );
    return MaterialApp(home: sb);
  }
}
