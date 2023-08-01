import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    required this.parrentContext,
    super.key,
  });

  final BuildContext parrentContext;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => parrentContext.closeModal(),
      child: const Text('Cancel'),
    );
  }
}
