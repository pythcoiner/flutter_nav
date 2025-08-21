import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/app.dart';

const int defaultHomeStartAt = 0; // Default page index
const int defaultHomeLength = 10; // Default entries per page

int now() => DateTime.now().microsecondsSinceEpoch;

// States
class AppBlocState {
  String route = "/home";
  int timestamp = now();

  AppBlocState();
}

class AppBloc extends Bloc<AppEvent, AppBlocState> {
  AppBloc() : super(AppBlocState()) {
    on<Update>((event, emit) {
      emit(AppBlocState()..timestamp = now());
    });

    on<NavigateTo>((event, emit) {
      final path = event.path.isEmpty ? '/home' : event.path;
      print("NavigateTo $path");

      emit(
        AppBlocState()
          ..route = path
          ..timestamp = now(),
      );
    });
  }

  void navigateTo(String path) => add(NavigateTo(path));
}
