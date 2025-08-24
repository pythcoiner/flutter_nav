import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_sink/bloc.dart';
import 'package:stream_sink/state/app_state.dart';

enum MenuButton {
  home,
  receive,
  send,
  settings;

  int toIndex() {
    return switch (this) {
      MenuButton.home => 0,
      MenuButton.send => 1,
      MenuButton.receive => 2,
      MenuButton.settings => 3,
    };
  }

  static MenuButton fromIndex(int index) {
    return switch (index) {
      1 => MenuButton.send,
      2 => MenuButton.receive,
      3 => MenuButton.settings,
      _ => MenuButton.home,
    };
  }
}

class Dashboard extends StatelessWidget {
  final String title;
  final Widget body;

  const Dashboard({required this.title, required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    Icon homeIcon = Icon(CupertinoIcons.home);
    Icon receiveIcon = Icon(CupertinoIcons.square_arrow_down);
    Icon sendIcon = Icon(CupertinoIcons.square_arrow_up);
    Icon settingsIcon = Icon(CupertinoIcons.settings);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: body),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          context.read<AppBloc>().menuButtonClicked(
            MenuButton.fromIndex(index),
          );
        },
        currentIndex: AppState.I.menuSelected.toIndex(),
        type: BottomNavigationBarType.shifting,
        selectedIconTheme: IconThemeData(color: Colors.orange),
        unselectedIconTheme: IconThemeData(color: Colors.blueAccent),
        items: [
          BottomNavigationBarItem(
            icon: homeIcon,
            label: "Home",
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: sendIcon,
            label: "Send",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: receiveIcon,
            label: "Receive",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: settingsIcon,
            label: "Settings",
            backgroundColor: Colors.black38,
          ),
        ],
      ),
    );
  }
}
