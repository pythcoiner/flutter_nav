import 'package:flutter/material.dart';
import '../../controller.dart';
import '../../widgets/dashboard.dart';

class SendScreenState {
  static const String path = '/send/';

  static SendScreenState state() {
    return AppController.I.screens.send.send ?? SendScreenState();
  }
}

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(
        title: "Send",
        body: Center(
          child: Column(
            children: [
              Text("Send"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => AppController.navigateTo("/home"),
                child: Text("Home"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => AppController.navigateTo("/send/verif"),
                child: Text("Verif"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
