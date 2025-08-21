import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc.dart';
import '../state/app_state.dart';

class SettingsScreenState {
  static const String path = '/settings';

  static SettingsScreenState state(AppBloc bloc) {
    return AppState.I.screens.settings ??= SettingsScreenState();
  }
}

class SettingsScreen extends StatelessWidget {
  final AppBloc bloc;

  const SettingsScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppBlocState>(
      bloc: bloc,
      builder: (context, state) {
        // final screenState = SettingsScreenState.state(bloc);
        return Scaffold(
          appBar: AppBar(title: const Text('Settings')),
          body: Column(
            children: [
              Text("Settings"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => bloc.navigateTo("/home"),
                child: Text("Home"),
              ),
            ],
          ),
        );
      },
    );
  }
}
