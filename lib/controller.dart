import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_sink/widgets/modal.dart';

import '../src/rust/api/interface.dart';
import '../widgets/dashboard.dart';
import 'state/currency.dart';
import 'state/screens.dart';
import 'state/wallet.dart';

class AppError {
  late final String msg;
  AppError(this.msg);
}

class Update {}

class AppController {
  // Singleton
  AppController._();
  static final AppController _instance = AppController._();
  static AppController get I => _instance;

  // Private state
  bool _isListeningController = false;
  final StreamController _uiUpdate = StreamController<Update>();

  // Public state
  final ScreenStates screens = ScreenStates();
  final WalletState wallet = WalletState();
  MenuButton menuSelected = MenuButton.home;
  CurrencyState currency = CurrencyState();
  List<AppError> errors = [];
  Widget? modal;
  String path = "/home";

  // Static methods

  Stream uiStream() {
    return AppController.I._uiUpdate.stream;
  }

  // we start listen the rust controller, can be started only once
  static void listenController() {
    if (!_instance._isListeningController) {
      _instance._isListeningController = true;
      RController().listen().listen((int balance) {
        _instance.wallet.accounts[0].confirmedBalance = balance;
      });
    }
  }

  static void error(AppError error) {
    if (AppController.I.modal != null) {
      AppController.I.errors.add(error);
    } else {
      AppController.I.modal = errorModal(error);
    }
    updateUI();
  }

  static void clearError() {
    if (AppController.I.errors.isNotEmpty) {
      AppError newError = AppController.I.errors[0];
      AppController.I.modal = errorModal(newError);
    } else {
      AppController.I.modal = null;
    }
    updateUI();
  }

  // trigger an update of the UI
  static void updateUI() {
    AppController.I._uiUpdate.add(Update());
  }

  static void navigateTo(String path) {
    AppController.I.path = path;
    AppController.I.uiStream();
  }

  static void menuButtonClicked(MenuButton menu) {
    AppController.I.path = switch (menu) {
      MenuButton.home => "/home",
      MenuButton.receive => "/receive",
      MenuButton.send => "/send",
      MenuButton.settings => "/settings",
    };
    AppController.updateUI();
  }
}
