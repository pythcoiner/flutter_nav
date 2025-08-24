import 'package:flutter/material.dart';

import '../../bloc.dart';

class Value<T> {
  late T value;
  Value(this.value);
}

TextFormField form(String label, TextEditingController ctrl) {
  return TextFormField(
    decoration: InputDecoration(label: Text(label)),
    controller: ctrl,
  );
}

DropdownButton comboBox<T>(List<T> elements, Value<T> value, AppBloc bloc) {
  return DropdownButton(
    value: value.value,
    items: [
      ...elements.map(
        (e) => DropdownMenuItem(value: e, child: Text(e.toString())),
      ),
    ],
    onChanged: (v) {
      value.value = v;
      bloc.update();
    },
  );
}
