import 'package:flutter/material.dart';
import 'package:stream_sink/widgets/modal.dart';

import '../bloc.dart';
import '../src/rust/api/interface.dart';
import '../widgets/dashboard.dart';
import 'currency.dart';
import 'wallet.dart';
import 'screens.dart';

class AppError {
  late final String msg;
  AppError(this.msg);
}

class AppState {
  // Singleton
  AppState._();
  static final AppState _instance = AppState._();
  static AppState get I => _instance;

  // Private state
  bool _isListeningController = false;
  final AppBloc _bloc = AppBloc();

  // Public state
  final ScreenStates screens = ScreenStates();
  final WalletState wallet = WalletState();
  MenuButton menuSelected = MenuButton.home;
  CurrencyState currency = CurrencyState();
  List<AppError> errors = [];
  Widget? modal;

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

  static AppBloc? get bloc {
    return _instance._bloc;
  }

  static void dispose() {
    _instance._bloc.close();
  }

  static onError(AppError error) {
    if (AppState.I.modal != null) {
      AppState.I.errors.add(error);
    } else {
      AppState.I.modal = errorModal(error);
    }
  }

  static onErrorClear() {
    if (AppState.I.errors.isNotEmpty) {
      AppError newError = AppState.I.errors[0];
      AppState.I.modal = errorModal(newError);
    } else {
      AppState.I.modal = null;
    }
  }
}
