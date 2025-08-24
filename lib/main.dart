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
        if (AppController.I.modal != null || AppController.I.modal != null) {
          screen = shadowed(router());
        } else {
          screen = router();
        }
        List<Widget> stack = [screen];
        if (AppController.I.banner != null) {
          stack.add(SafeArea(child: AppController.I.banner!));
        }
        if (AppController.I.bottomModal != null) {
          stack.add(AppController.I.bottomModal!);
        }
        if (AppController.I.modal != null) {
          stack.add(AppController.I.modal!);
        }
        return Stack(children: stack);
      },
    );
    return MaterialApp(home: sb);
  }
}
