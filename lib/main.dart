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
        late Widget screen;
        bool shadow =
            (AppController.I.modal != null || AppController.I.modal != null);
        if (shadow) {
          screen = shadowed(router());
        } else {
          screen = router();
        }
        List<Widget> stack = [screen];
        if (AppController.I.banner != null) {
          if (shadow) {
            stack.add(shadowed(SafeArea(child: AppController.I.banner!)));
          } else {
            stack.add(SafeArea(child: AppController.I.banner!));
          }
        }
        // NOTE: bottom modal is managed in Dashboard
        if (AppController.I.modal != null) {
          stack.add(AppController.I.modal!);
        }
        return Stack(children: stack);
      },
    );
    return MaterialApp(home: sb);
  }
}
