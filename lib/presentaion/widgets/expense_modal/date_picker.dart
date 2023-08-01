import 'package:expense_tracker/presentaion/bloc/create_new_expense/create_new_expense_bloc.dart';
import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/date_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewExpenseBloc, CreateNewExpenseState>(
      buildWhen: (
        previous,
        current,
      ) =>
          previous.selectedDate != current.selectedDate,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(state.selectedDate?.formattedDate ?? 'No date picked'),
            Builder(
              builder: (context) => IconButton(
                onPressed: () => context.setDate(
                  lastChosenDate: state.selectedDate,
                ),
                icon: const Icon(Icons.calendar_month),
              ),
            )
          ],
        );
      },
    );
  }
}
