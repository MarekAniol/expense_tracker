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
      builder: (context) => const Text("Modal"),
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
