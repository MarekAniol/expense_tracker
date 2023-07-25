import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/presentaion/extensions/category_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/date_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    required this.expense,
    super.key,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    expense.category.getIcon(
                      context.palette.accentColor,
                    ),
                    const SizedBox(width: 8),
                    Text(expense.date.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
