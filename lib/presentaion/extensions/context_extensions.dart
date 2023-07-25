import 'package:expense_tracker/presentaion/bloc/create_new_expense/create_new_expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension DateCalendarExtensions on BuildContext {
  Future<DateTime> presentDatePicker(DateTime? lastChosenDate) async {
    final DateTime? picked = await showDatePicker(
      context: this,
      initialDate: lastChosenDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
      currentDate: lastChosenDate,
    );
    return picked ?? DateTime.now();
  }

  Future<void> setDate({
    required DateTime? lastChosenDate,
  }) async {
    final selectedDate = await presentDatePicker(lastChosenDate);
    read<CreateNewExpenseBloc>().add(
      CreateNewExpenseEvent.datePicked(
        date: selectedDate,
      ),
    );
  }
}

extension NavigatorExtensions on BuildContext {
  void closeModal() => Navigator.pop(this);
}

extension PopUpExtension on BuildContext {
  void showCustomPopup() {
    showDialog(
      context: this,
      builder: (context) => AlertDialog(
        title: const Text('Invalid input'),
        content: const Text('Please enter a valid title, amount, date and category'),
        actions: [
          TextButton(
            onPressed: () => context.closeModal(),
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  void showCustomSnackBar({
    required Function() onUndoPressed,
  }) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(
          seconds: 5,
        ),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: onUndoPressed,
        ),
      ),
    );
  }
}

extension ThemeOfContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}
