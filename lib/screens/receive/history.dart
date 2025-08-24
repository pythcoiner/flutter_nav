import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/app_state.dart';
import '../../../bloc.dart';
import '../../widgets/dashboard.dart';

class ReceiveHistoryScreenState {
  static const String path = '/receive/history';

  static ReceiveHistoryScreenState state(AppBloc bloc) {
    return AppState.I.screens.receive.history ?? ReceiveHistoryScreenState();
  }
}

class ReceiveHistoryScreen extends StatelessWidget {
  final AppBloc bloc;

  const ReceiveHistoryScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppBlocState>(
      bloc: bloc,
      builder: (context, state) {
        // final screenState = ReceiveHistoryScreenState.state(bloc);
        return Scaffold(
          body: Dashboard(
            title: "Receive > History",
            body: Column(
              children: [
                Text("History"),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => bloc.navigateTo("/receive"),
                  child: Text("Back"),
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
