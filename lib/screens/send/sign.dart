import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/app_state.dart';
import '../../../bloc.dart';
import '../../widgets/dashboard.dart';

class SignScreenState {
  static const String path = '/send/sign';

  static SignScreenState state(AppBloc bloc) {
    return AppState.I.screens.send.sign ?? SignScreenState();
  }
}

class SignScreen extends StatelessWidget {
  final AppBloc bloc;

  const SignScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppBlocState>(
      bloc: bloc,
      builder: (context, state) {
        // final screenState = SignScreenState.state(bloc);
        return Scaffold(
          body: Dashboard(
            title: "Send > Sign",
            body: Center(
              child: Column(
                children: [
                  Text("Sign"),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => bloc.navigateTo("/send/verif"),
                    child: Text("Back"),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => bloc.navigateTo("/send/broadcast"),
                    child: Text("Broadcast"),
                  ),
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
