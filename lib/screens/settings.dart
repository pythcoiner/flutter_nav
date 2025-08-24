import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc.dart';
import '../state/app_state.dart';
import '../state/currency.dart';
import '../widgets/dashboard.dart';
import '../widgets/form.dart';

List<Currency> currencies() {
  return [Currency.btc, Currency.sat, Currency.usd, Currency.eur];
}

class SettingsScreenState {
  static const String path = '/settings';

  // electrum url field
  final _electrumUrl = TextEditingController();
  TextFormField electrumUrl() => form("Electrum URL", _electrumUrl);

  // electrum url port
  final _electrumPort = TextEditingController();
  TextFormField electrumPort() => form("Electrum port", _electrumPort);

  // electrum look_ahead
  final _electrumLookAhead = TextEditingController();
  TextFormField electrumLookAhead() =>
      form("Electrum look ahead", _electrumLookAhead);

  // displayed currency
  final _currency = Value(Currency.btc);
  DropdownButton currency(AppBloc bloc) =>
      comboBox(currencies(), _currency, bloc);

  SettingsScreenState() {
    _electrumUrl.text = "abcd";
  }

  static SettingsScreenState state() {
    return AppState.I.screens.settings;
  }
}

class SettingsScreen extends StatelessWidget {
  final AppBloc bloc;

  const SettingsScreen({super.key, required this.bloc});

  static Widget body(AppBloc bloc) {
    SettingsScreenState screenState = SettingsScreenState.state();
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        children: [
          Text("Settings"),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => bloc.navigateTo("/home"),
            child: Text("Home"),
          ),
          SizedBox(height: 20),
          screenState.electrumUrl(),
          SizedBox(height: 20),
          Row(
            spacing: 10.0,
            children: [
              Expanded(child: screenState.electrumPort()),
              Expanded(child: screenState.electrumLookAhead()),
            ],
          ),
          Row(
            spacing: 10.0,
            children: [Text("Displayed currency"), screenState.currency(bloc)],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppBlocState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          body: Dashboard(title: "Settings", body: body(bloc)),
        );
      },
    );
  }
}
