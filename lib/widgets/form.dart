import 'package:flutter/material.dart';

import '../controller.dart';

DropdownButton comboBox<T>(List<T> elements, Value<T> value) {
  return DropdownButton(
    value: value.value,
    items: [
      ...elements.map(
        (e) => DropdownMenuItem(value: e, child: Text(e.toString())),
      ),
    ],
    onChanged: (v) {
      value.value = v;
      AppController.updateUI();
    },
  );
}

TextFormField form(String label, TextEditingController ctrl) {
  return TextFormField(
    decoration: InputDecoration(label: Text(label)),
    controller: ctrl,
  );
}

class Value<T> {
  late T value;
  Value(this.value);
}
