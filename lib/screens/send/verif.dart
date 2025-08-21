import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/app_state.dart';
import '../../../bloc.dart';

class VerifScreenState {
  static const String path = '/send/verif';

  static VerifScreenState state(AppBloc bloc) {
    return AppState.I.screens.send.verif ?? VerifScreenState();
  }
}

class VerifScreen extends StatelessWidget {
  final AppBloc bloc;

  const VerifScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppBlocState>(
      bloc: bloc,
      builder: (context, state) {
        // final screenState = VerifScreenState.state(bloc);
        return Scaffold(
          appBar: AppBar(title: Center(child: const Text('Verification'))),
          body: Center(
            child: Column(
              children: [
                Text("Verification"),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => bloc.navigateTo("/send"),
                  child: Text("Back"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => bloc.navigateTo("/send/sign"),
                  child: Text("Sign"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => bloc.navigateTo("/home"),
                  child: Text("Home"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
