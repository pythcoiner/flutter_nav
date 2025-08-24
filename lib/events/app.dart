import '../widgets/dashboard.dart';
import '../state/app_state.dart';

abstract class AppEvent {}

class UpdateEvent extends AppEvent {}

class NavigateToEvent extends AppEvent {
  final String path;
  NavigateToEvent(this.path);
}

class MenuButtonClickedEvent extends AppEvent {
  final MenuButton button;
  MenuButtonClickedEvent(this.button);
}

class ErrorEvent extends AppEvent {
  final AppError error;
  ErrorEvent(this.error);
}

class ClearErrorEvent extends AppEvent {}
