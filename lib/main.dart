import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_sink/routes.dart';

import 'src/rust/api/interface.dart';
import 'src/rust/frb_generated.dart';

import 'bloc.dart';
import 'state/app_state.dart';

Future<void> main() async {
  await RustLib.init();
  RController.init();
  AppState.listenController();

  runApp(MyApp(bloc: AppState.bloc!));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.bloc, super.key});
  final AppBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: MaterialApp(
        title: 'Navigation',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: BlocBuilder<AppBloc, AppBlocState>(
          builder: (context, state) {
            return router(context.read<AppBloc>());
          },
        ),
      ),
    );
  }
}
