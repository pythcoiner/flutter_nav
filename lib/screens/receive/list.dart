import 'package:flutter/material.dart';
import '../../controller.dart';
import '../../widgets/dashboard.dart';

class AddressesListScreenState {
  static const String path = '/receive/list';

  static AddressesListScreenState state() {
    return AppController.I.screens.receive.list ?? AddressesListScreenState();
  }
}

class AddressesListScreen extends StatelessWidget {
  const AddressesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(
        title: "Receive > Addr. list",
        body: Column(
          children: [
            Text("List"),
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
