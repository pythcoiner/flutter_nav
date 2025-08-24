import 'package:flutter/material.dart';
import '../../controller.dart';
import '../../widgets/dashboard.dart';

class ReceiveHistoryScreenState {
  static const String path = '/receive/history';

  static ReceiveHistoryScreenState state() {
    return AppController.I.screens.receive.history ??
        ReceiveHistoryScreenState();
  }
}

class ReceiveHistoryScreen extends StatelessWidget {
  const ReceiveHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(
        title: "Receive > History",
        body: Column(
          children: [
            Text("History"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => AppController.navigateTo("/receive"),
              child: Text("Back"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => AppController.navigateTo("/home"),
              child: Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
