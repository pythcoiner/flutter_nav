import 'package:flutter/material.dart';
import '../../controller.dart';
import '../../widgets/dashboard.dart';

class SignScreenState {
  static const String path = '/send/sign';

  static SignScreenState state() {
    return AppController.I.screens.send.sign ?? SignScreenState();
  }
}

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(
        title: "Send > Sign",
        body: Center(
          child: Column(
            children: [
              Text("Sign"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => AppController.navigateTo("/send/verif"),
                child: Text("Back"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => AppController.navigateTo("/send/broadcast"),
                child: Text("Broadcast"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => AppController.navigateTo("/home"),
                child: Text("Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
