import 'package:flutter/material.dart';

extension TextFormFieldTextExtension on TextEditingController {
  void handleInput(String value) {
    if (value.contains(',')) {
      value = value.replaceAll(',', '.');
      text = value;
      selection = TextSelection.fromPosition(
        TextPosition(
          offset: text.length,
        ),
      );
    }

    RegExp startWithDotPattern = RegExp(r'^\.(?:\d*)$');
    bool isStartWithDotMatch = startWithDotPattern.hasMatch(value);

    if (isStartWithDotMatch && value.startsWith(RegExp(r'\.\d*'))) {
      text = "0$value";
      selection = TextSelection.fromPosition(
        TextPosition(
          offset: text.length,
        ),
      );
    }

    if (value.indexOf('.') != value.lastIndexOf('.')) {
      text = value.substring(0, value.indexOf('.') + 1) +
          value.substring(value.indexOf('.') + 1).replaceAll('.', '');
      selection = TextSelection.fromPosition(
        TextPosition(
          offset: text.length,
        ),
      );
    }

    if (value.startsWith("0") && value.length > 1 && value[1] != ".") {
      text = value.substring(1);
      selection = TextSelection.fromPosition(
        TextPosition(
          offset: text.length,
        ),
      );
    }
  }
}
