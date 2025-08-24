import 'package:flutter/material.dart';
import 'controller.dart';
import 'screens/home.dart';
import 'screens/send/send.dart';
import 'screens/send/broadcast.dart';
import 'screens/send/verif.dart';
import 'screens/send/sign.dart';
import 'screens/receive/receive.dart';
import 'screens/receive/history.dart';
import 'screens/receive/list.dart';
import 'screens/settings.dart';

Widget router() {
  final path = AppController.I.path;
  print("router: $path");
  switch (path) {
    case '/send':
    case '/send/send':
      return SendScreen();
    case '/send/broadcast':
      return BroadcastScreen();
    case '/send/verif':
      return VerifScreen();
    case '/send/sign':
      return SignScreen();
    case '/receive':
    case '/receive/receive':
      return ReceiveScreen();
    case '/receive/history':
      return ReceiveHistoryScreen();
    case '/receive/list':
      return AddressesListScreen();
    case '/settings':
      return SettingsScreen();
    case '/home':
    default:
      return HomeScreen();
  }
}
