import '../screens/home.dart';
import '../screens/send/send.dart';
import '../screens/send/sign.dart';
import '../screens/send/verif.dart';
import '../screens/send/broadcast.dart';
import '../screens/receive/receive.dart';
import '../screens/receive/list.dart';
import '../screens/receive/history.dart';
import '../screens/settings.dart';

class ScreenStates {
  HomeScreenState home = HomeScreenState();
  SendStates send = SendStates();
  ReceiveStates receive = ReceiveStates();
  SettingsScreenState settings = SettingsScreenState();
}

class SendStates {
  SendScreenState? send;
  VerifScreenState? verif;
  SignScreenState? sign;
  BroadcastScreenState? broadcast;
}

class ReceiveStates {
  static const String path = '/send/verif';
  ReceiveScreenState? receive;
  AddressesListScreenState? list;
  ReceiveHistoryScreenState? history;
}
