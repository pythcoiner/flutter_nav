import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/app_state.dart';
import '../../../bloc.dart';

class AddressesListScreenState {
  static const String path = '/receive/list';

  static AddressesListScreenState state(AppBloc bloc) {
    return AppState.I.screens.receive.list ?? AddressesListScreenState();
  }
}

class AddressesListScreen extends StatelessWidget {
  final AppBloc bloc;

  const AddressesListScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppBlocState>(
      bloc: bloc,
      builder: (context, state) {
        // final screenState = AddressesListScreenState.state(bloc);
        return Scaffold(
          appBar: AppBar(title: const Text('List')),
          body: Column(
            children: [
              Text("List"),
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
        );
      },
    );
  }
}
