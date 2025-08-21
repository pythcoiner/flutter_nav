import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/send/send.dart';
import 'screens/send/broadcast.dart';
import 'screens/send/verif.dart';
import 'screens/send/sign.dart';
import 'screens/receive/receive.dart';
import 'screens/receive/history.dart';
import 'screens/receive/list.dart';
import 'screens/settings.dart';
import 'bloc.dart';

Widget router(AppBloc bloc) {
  final path = bloc.state.route;
  print("router: $path");
  switch (path) {
    case '/send':
    case '/send/send':
      return SendScreen(bloc: bloc);
    case '/send/broadcast':
      return BroadcastScreen(bloc: bloc);
    case '/send/verif':
      return VerifScreen(bloc: bloc);
    case '/send/sign':
      return SignScreen(bloc: bloc);
    case '/receive':
    case '/receive/receive':
      return ReceiveScreen(bloc: bloc);
    case '/receive/history':
      return ReceiveHistoryScreen(bloc: bloc);
    case '/receive/list':
      return AddressesListScreen(bloc: bloc);
    case '/settings':
      return SettingsScreen(bloc: bloc);
    case '/home':
    default:
      return HomeScreen(bloc: bloc);
  }
}
