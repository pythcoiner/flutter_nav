import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_sink/state/app_state.dart';
import '../../bloc.dart';

class HomeScreenState {
  int index = 0;
  int offset = 10;
  int max = 100;

  static const String path = '/home';

  static HomeScreenState state(AppBloc bloc) {
    return AppState.I.screens.home ?? HomeScreenState();
  }

  void up() {
    if (index >= offset) {
      index -= offset;
    } else {
      index = 0;
    }
  }

  void down() {
    if (index < (max - offset)) {
      index += offset;
    } else {
      index = (max - offset);
    }
  }
}

class HomeScreen extends StatelessWidget {
  final AppBloc bloc;

  const HomeScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final balance = AppState.I.wallet.accounts[0].confirmedBalance;
    return BlocBuilder<AppBloc, AppBlocState>(
      bloc: bloc,
      builder: (context, state) {
        final screenState = HomeScreenState.state(bloc);
        return Scaffold(
          appBar: AppBar(title: Center(child: const Text('Home'))),
          body: Column(
            children: [
              Text(
                'Start: ${screenState.index}, End: ${screenState.index + screenState.offset}',
              ),
              Text('Balance: $balance'),
              Text('Current Path: ${state.route}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () => {}, child: const Text('Up')),
                  ElevatedButton(onPressed: () {}, child: const Text('Down')),
                ],
              ),
              ElevatedButton(
                onPressed: () => bloc.navigateTo("/send"),
                child: const Text('Send'),
              ),
              ElevatedButton(
                onPressed: () => bloc.navigateTo("/receive"),
                child: const Text('Receive'),
              ),
              ElevatedButton(
                onPressed: () => bloc.navigateTo("/settings"),
                child: const Text('Settings'),
              ),
            ],
          ),
        );
      },
    );
  }
}
