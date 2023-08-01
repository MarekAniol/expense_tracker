import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

extension PaddingExtension on BuildContext {
  EdgeInsetsGeometry get modalPadding => EdgeInsets.fromLTRB(
        16,
        16,
        16,
        keyboardHeight + 16,
      );
}
