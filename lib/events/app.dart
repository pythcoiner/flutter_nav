abstract class AppEvent {}

class Update extends AppEvent {
  final int balance;
  Update(this.balance);
}

class NavigateTo extends AppEvent {
  final String path;
  NavigateTo(this.path);
}
