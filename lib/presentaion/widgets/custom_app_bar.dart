import 'package:expense_tracker/presentaion/widgets/new_expense_modal.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.height = kToolbarHeight,
    super.key,
  });
  final double height;

  void _openModalExpenseForm(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (ctx) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: NewExpenseModal(
              homeContext: context,
              modalContext: ctx,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      actions: [
        IconButton(
          onPressed: () {
            _openModalExpenseForm(
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
