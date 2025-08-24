import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/app_state.dart';
import '../../../bloc.dart';
import '../../widgets/dashboard.dart';

class BroadcastScreenState {
  static const String path = '/send/broadcast';

  static BroadcastScreenState state(AppBloc bloc) {
    return AppState.I.screens.send.broadcast ?? BroadcastScreenState();
  }
}

class BroadcastScreen extends StatelessWidget {
  final AppBloc bloc;

  const BroadcastScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppBlocState>(
      bloc: bloc,
      builder: (context, state) {
        // final screenState = BroadcastScreenState.state(bloc);
        return Scaffold(
          body: Dashboard(
            title: "Send > Broadcast",
            body: Center(
              child: Column(
                children: [
                  Text("Broadcast"),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => bloc.navigateTo("/send/sign"),
                    child: Text("Back"),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: () => {}, child: Text("Broadcast")),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => bloc.navigateTo("/home"),
                    child: Text("Home"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
