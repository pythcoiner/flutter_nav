import 'package:stream_sink/bloc.dart';
import 'package:stream_sink/src/rust/api/interface.dart';

import 'wallet.dart';
import 'screens.dart';

class AppState {
  // Singleton
  AppState._();
  static final AppState _instance = AppState._();
  static AppState get I => _instance;

  // Private state
  bool _isListeningController = false;
  final AppBloc _bloc = AppBloc();
  bool _blocShared = false;

  // Public state
  final ScreenStates screens = ScreenStates();
  final WalletState wallet = WalletState();

  // Static methods

  // we start listen the rust controller, can be started only once
  static void listenController() {
    if (!_instance._isListeningController) {
      _instance._isListeningController = true;
      RController().listen().listen((int balance) {
        _instance.wallet.accounts[0].confirmedBalance = balance;
      });
    }
  }

  // We share the bloc only once for BlocProvider registration
  static AppBloc? get bloc {
    if (_instance._blocShared) {
      return null;
    } else {
      _instance._blocShared = true;
      return _instance._bloc;
    }
  }

  static void dispose() {
    _instance._bloc.close();
  }
}
