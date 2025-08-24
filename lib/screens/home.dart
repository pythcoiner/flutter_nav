import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_sink/events/app.dart';
import '../../bloc.dart';
import '../state/app_state.dart';
import '../widgets/dashboard.dart';

class HomeScreenState {
  int index = 0;
  int offset = 10;
  int max = 100;

  static const String path = '/home';

  static HomeScreenState state(AppBloc bloc) {
    return AppState.I.screens.home;
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
        return Dashboard(
          title: "Home",
          body: Column(
            children: [
              Text(
                'Start: ${screenState.index}, End: ${screenState.index + screenState.offset}',
              ),
              Text('Balance: $balance'),
              Text('Current Path: ${state.getRoute()}'),
              ElevatedButton(
                onPressed: () => bloc.add(ErrorEvent(AppError("Test error!"))),
                child: Text("Trigger an error"),
              ),
            ],
          ),
        );
      },
    );
  }
}
