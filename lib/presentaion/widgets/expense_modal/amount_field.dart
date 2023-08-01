import 'package:expense_tracker/presentaion/bloc/create_new_expense/create_new_expense_bloc.dart';
import 'package:expense_tracker/presentaion/extensions/text_controller_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmountField extends StatelessWidget {
  const AmountField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d*\.?,?\d{0,2}'),
        ),
      ],
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      onChanged: (value) {
        controller.handleInput(value);
        context.read<CreateNewExpenseBloc>().add(
              CreateNewExpenseEvent.amountAdded(
                amount: controller.text,
              ),
            );
      },
      decoration: const InputDecoration(
        prefixText: '\$ ',
        label: Text('Amount'),
      ),
    );
  }
}
