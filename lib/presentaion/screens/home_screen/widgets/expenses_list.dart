import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        title: Text('Expense $index'),
        subtitle: Text('Expense $index'),
        trailing: Text('Expense $index'),
      ),
    );
  }
}
