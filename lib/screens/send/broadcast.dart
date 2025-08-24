import 'package:flutter/material.dart';
import '../../controller.dart';
import '../../widgets/dashboard.dart';

class BroadcastScreenState {
  static const String path = '/send/broadcast';

  static BroadcastScreenState state() {
    return AppController.I.screens.send.broadcast ?? BroadcastScreenState();
  }
}

class BroadcastScreen extends StatelessWidget {
  const BroadcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(
        title: "Send > Broadcast",
        body: Center(
          child: Column(
            children: [
              Text("Broadcast"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => AppController.navigateTo("/send/sign"),
                child: Text("Back"),
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () => {}, child: Text("Broadcast")),
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
