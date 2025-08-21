import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/app_state.dart';
import '../../../bloc.dart';

class SendScreenState {
  static const String path = '/send/';

  static SendScreenState state(AppBloc bloc) {
    return AppState.I.screens.send.send ?? SendScreenState();
  }
}

class SendScreen extends StatelessWidget {
  final AppBloc bloc;

  const SendScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppBlocState>(
      bloc: bloc,
      builder: (context, state) {
        // final screenState = SendScreenState.state(bloc);
        return Scaffold(
          appBar: AppBar(title: Center(child: const Text('Send'))),
          body: Center(
            child: Column(
              children: [
                Text("Send"),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => bloc.navigateTo("/home"),
                  child: Text("Home"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => bloc.navigateTo("/send/verif"),
                  child: Text("Verif"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
