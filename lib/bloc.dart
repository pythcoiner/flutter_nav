import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/app.dart';
import 'state/app_state.dart';
import 'widgets/dashboard.dart';

const int defaultHomeStartAt = 0; // Default page index
const int defaultHomeLength = 10; // Default entries per page

int now() => DateTime.now().microsecondsSinceEpoch;

// States
class AppBlocState {
  String _route = "/home";

  AppBlocState copy() {
    return AppBlocState().route(_route);
  }

  AppBlocState route(String route) {
    _route = route;
    return this;
  }

  String getRoute() {
    return _route;
  }
}

class AppBloc extends Bloc<AppEvent, AppBlocState> {
  AppBloc() : super(AppBlocState()) {
    on<ClearErrorEvent>((_, emit) {
      AppState.onErrorClear();
      emit(state.copy());
    });

    on<ErrorEvent>((event, emit) {
      AppState.onError(event.error);

      emit(state.copy());
    });

    on<UpdateEvent>((_, emit) {
      emit(state.copy());
    });

    on<NavigateToEvent>((event, emit) {
      final path = event.path.isEmpty ? '/home' : event.path;
      print("NavigateTo $path");

      emit(state.copy().route(path));
    });

    on<MenuButtonClickedEvent>((event, emit) {
      AppState.I.menuSelected = event.button;
      switch (event.button) {
        case MenuButton.home:
          add(NavigateToEvent("/home"));
        case MenuButton.receive:
          add(NavigateToEvent("/receive"));
        case MenuButton.send:
          add(NavigateToEvent("/send"));
        case MenuButton.settings:
          add(NavigateToEvent("/settings"));
      }

      emit(state.copy());
    });
  }

  void navigateTo(String path) => add(NavigateToEvent(path));
  void menuButtonClicked(MenuButton btn) => add(MenuButtonClickedEvent(btn));
  void update() => add(UpdateEvent());
}
