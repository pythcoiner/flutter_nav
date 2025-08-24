import 'package:flutter/material.dart';
import '../../controller.dart';
import '../../widgets/dashboard.dart';

class ReceiveScreenState {
  static ReceiveScreenState state() {
    return AppController.I.screens.receive.receive ?? ReceiveScreenState();
  }
}

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(
        title: "Receive",
        body: Center(
          child: Column(
            children: [
              Text("Receive"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => AppController.navigateTo("/home"),
                child: Text("Home"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => AppController.navigateTo("/receive/list"),
                child: Text("List"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => AppController.navigateTo("/receive/history"),
                child: Text("History"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
