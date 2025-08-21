import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/app_state.dart';
import '../../../bloc.dart';

class ReceiveScreenState {
  static const String path = '/receive';

  static ReceiveScreenState state(AppBloc bloc) {
    return AppState.I.screens.receive.receive ?? ReceiveScreenState();
  }
}

class ReceiveScreen extends StatelessWidget {
  final AppBloc bloc;

  const ReceiveScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppBlocState>(
      bloc: bloc,
      builder: (context, state) {
        // final screenState = ReceiveScreenState.state(bloc);
        return Scaffold(
          appBar: AppBar(title: Center(child: const Text('Receive'))),
          body: Center(
            child: Column(
              children: [
                Text("Receive"),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => bloc.navigateTo("/home"),
                  child: Text("Home"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => bloc.navigateTo("/receive/list"),
                  child: Text("List"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => bloc.navigateTo("/receive/history"),
                  child: Text("History"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
