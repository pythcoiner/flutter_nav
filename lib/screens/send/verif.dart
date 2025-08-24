import 'package:flutter/material.dart';
import '../../controller.dart';
import '../../widgets/dashboard.dart';

class VerifScreenState {
  static const String path = '/send/verif';

  static VerifScreenState state() {
    return AppController.I.screens.send.verif ?? VerifScreenState();
  }
}

class VerifScreen extends StatelessWidget {
  const VerifScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(
        title: "Send > Verify",
        body: Center(
          child: Column(
            children: [
              Text("Verification"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => AppController.navigateTo("/send"),
                child: Text("Back"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => AppController.navigateTo("/send/sign"),
                child: Text("Sign"),
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
