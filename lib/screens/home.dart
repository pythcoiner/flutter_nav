import 'package:flutter/material.dart';
import '../controller.dart';
import '../widgets/dashboard.dart';

class HomeScreenState {
  int index = 0;
  int offset = 10;
  int max = 100;

  static const String path = '/home';

  static HomeScreenState state() {
    return AppController.I.screens.home;
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final balance = AppController.I.wallet.accounts[0].confirmedBalance;
    return Dashboard(
      title: "Home",
      body: Column(
        children: [
          Text('Balance: $balance'),
          Text('Current Path: ${AppController.I.path}'),
          ElevatedButton(
            onPressed: () => AppController.error(AppError("Test error")),
            child: Text("Trigger an error"),
          ),
          ElevatedButton(
            onPressed: () =>
                AppController.notif(UserNotif("This is a test notification")),
            child: Text("Trigger a notification"),
          ),
        ],
      ),
    );
  }
}
