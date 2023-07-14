import 'package:expense_tracker/presentaion/widgets/new_expense_modal.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.height = kToolbarHeight,
    super.key,
  });
  final double height;

  void _openMocalExpenseForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      builder: (context) => const NewExpenseModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            _openMocalExpenseForm(
              context,
            );
          },
          icon: const Icon(Icons.add),
        ),
      ],
      title: const Text("Expense Tracker"),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
